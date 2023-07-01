import 'package:flutter/material.dart';
import 'package:mlmodel/pages/btm_nav_bar.dart';
import 'package:mlmodel/provider/favorite_provider.dart';
import 'package:mlmodel/widgets/customtxtfield.dart';
import 'package:provider/provider.dart';
class LoginPage extends StatefulWidget {

  LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _name = TextEditingController();
  @override
  String? gender;
  String? name;
  double? age,height,weight;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/icon_foreground.png',height: 150,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  hintText: "Enter your Name",
                  hintStyle: TextStyle(
                      color: Colors.black
                  ),
                  enabledBorder:OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepPurple,
                    ),),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepPurple,
                    ),
                  ),

                ),
                controller: _name,

              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                type: TextInputType.number,
                hintText: 'Enter your weight',
                onap: (value){
                  weight = double.parse(value);
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                type: TextInputType.number,
                hintText: 'Enter your height in cm',
                onap: (value){
                  height = double.parse(value);
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                type: TextInputType.number,
                hintText: 'Enter your Age',
                onap: ( value){
                  age = double.parse(value);
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text("Male"),
                  value: "male",
                  groupValue: gender,
                  onChanged: (value){
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),

                RadioListTile(
                  title: Text("Female"),
                  value: "female",
                  groupValue: gender,
                  onChanged: (value){
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap:()async{
                final docData = {
                  "name": _name.text.trim(),
                  "age" : age,
                  "height" : height,
                  "weight" : weight,
                  "gender" : gender
                };
                await Future.delayed(const Duration(seconds: 2));
                await Future.delayed(const Duration(seconds: 3));
                Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBar()));
              },
              child: Center(
                child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: const Center(child: Text('Submit',style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),)),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
