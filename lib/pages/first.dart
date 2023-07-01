import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mlmodel/pages/btm_nav_bar.dart';
import 'package:mlmodel/pages/sign_up.dart';
import 'dart:convert';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/disease_food.dart';
import '../provider/favorite_provider.dart';


class LoginScreen extends StatefulWidget {
  static String id = 'login page';
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final url =
  Uri.parse('https://test1-alpvsk9li-minagorge1.vercel.app/auth/sign_in');
  TextEditingController emailController = TextEditingController();
  TextEditingController passController= TextEditingController();
  bool _obsecureText = true;
  bool showSpineer = false;

  Future SignIn( String pass , String email)async{
    final header = {HttpHeaders.contentTypeHeader: "application/json"};
    Map<String, dynamic> bodyData = {
      "email": email,
      "password": pass,
    };
    final response = await http.post(url,
        body:  convert.jsonEncode(bodyData),
        headers: header);
    final responsePayload = json.decode(response.body);
    print(responsePayload);
    dynamic result = responsePayload['message'];
    print(result);


    if (result == "Done"){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavBar()));
      Fluttertoast.showToast(msg:'Successfully Login' );
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var isSigned = prefs.setString('email', email);
      print('Successfully Login');

    }else {
      Fluttertoast.showToast(msg:result);
      print('pls try again later');
    }
    setState(() {
      showSpineer = false;
    });

  }
  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return initWidget();

  }

  initWidget() {
    final provider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: showSpineer,
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
                        color: Colors.deepPurple,

                      ),
                      child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 50),
                                child: Image.asset(
                                  "assets/Untitled-1.png",
                                  height: 150,
                                  width: 150,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 20, top: 20),
                                alignment: Alignment.bottomRight,
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white
                                  ),
                                ),
                              )
                            ],
                          )
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 20, right: 20, top: 70),
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      height: 54,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[200],
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 50,
                              color: Color(0xffEEEEEE)
                          ),
                        ],
                      ),
                      child: TextFormField(
                        validator: (value){
                          if (value!.isEmpty || !value.contains('@')){
                            return 'Please Fill Email Input';
                          }
                          return null;
                        },
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.deepPurple,
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: Colors.deepPurple,
                          ),
                          hintText: "Enter Email",
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      height: 54,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xffEEEEEE),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 20),
                              blurRadius: 100,
                              color: Color(0xffEEEEEE)
                          ),
                        ],
                      ),
                      child: TextFormField(
                        validator: (value){
                          if (value!.isEmpty){
                            return 'Please Fill Password Input';
                          }else if (value.length<4){
                            return"لا يمكن النص ان يكون من اربع احرف او ارقام";
                          }
                          return null;
                        },
                        obscureText: _obsecureText,
                        controller: passController,
                        cursorColor: Colors.deepPurple,
                        decoration:  InputDecoration(
                          focusColor: Colors.deepPurple,
                          icon: const Icon(
                            Icons.vpn_key,
                            color: Colors.deepPurple,
                          ),
                          hintText: "Enter Password",
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obsecureText = !_obsecureText;
                              });
                            },
                            child: Icon(
                              _obsecureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.deepPurple,
                            ),
                          ),
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        if(_formkey.currentState!.validate()) {
                          setState(() {
                            showSpineer = true;
                          });
                          SignIn(passController.text.trim() , emailController.text.trim());


                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(left: 20, right: 20, top: 70),
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        height: 54,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.deepPurple,
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Color(0xffEEEEEE)
                            ),
                          ],
                        ),
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't Have Any Account?  "),
                          GestureDetector(
                            child: const Text(
                              "Register Now",
                              style: TextStyle(
                                  color: Colors.deepPurple
                              ),
                            ),
                            onTap: () {
                              // Write Tap Code Here.
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUp(),
                                  )
                              );
                            },
                          )
                        ],
                      ),
                    )
                  ],
                )
            ),
          ),
        )
    );
  }
}