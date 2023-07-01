import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:mlmodel/constants/disease_food.dart';
import 'package:mlmodel/pages/favorites.dart';
import 'package:mlmodel/pages/first.dart';
import 'package:mlmodel/pages/search_par.dart';
import 'package:mlmodel/provider/favorite_provider.dart';
import 'package:mlmodel/result_page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MlModel extends StatefulWidget {
  @override
  State<MlModel> createState() => _MlModelState();
}

class _MlModelState extends State<MlModel> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLoading = false;
  Map symptms = {
    "41": 'fatigue',
    "129": 'weight loss',
    "94": 'restlessness',
    "60": 'lethargy',
    "53": 'irregular sugar level',
    "13": 'blurred and distorted vision',
    "76": 'obesity',
    "49": 'increased appetite',
    "85": 'polyuria',
    "37": 'excessive hunger',
    "19": 'chills',
    "26": 'cough',
    "46": 'high fever',
    "14": 'breathlessness',
    "65": 'malaise',
    "84": 'phlegm',
    "18": 'chest pain',
    "40": 'fast heart rate',
    "111": 'swelled lymph nodes',
  };
  List<String> itemsList = [
    'fatigue',
    'weight loss',
    'restlessness',
    'lethargy',
    'irregular sugar level',
    'blurred and distorted vision',
    'obesity',
    'increased appetite',
    'polyuria',
    'excessive hunger',
    'chills',
    'cough',
    'high fever',
    'breathlessness',
    'malaise',
    'phlegm',
    'chest pain',
    'fast heart rate',
    'swelled lymph nodes'
  ];
  String? selectedItem;
  String? selectedItem2;
  String? selectedItem3;
  String? selectedItem4;
  String? selectedItem5;
  bool showSpineer = false;
  bool Spineer = false;
  String Disease = '';
  GlobalKey<FormState> _formkey = new GlobalKey<FormState>();
  final url = Uri.parse('https://flask-production-5702.up.railway.app//api');
  Future<String> addUser(
      String d1, String d2, String d3, String d4, String d5) async {
    final header = {"Content_type": "multipart/form-data"};
    final response = await http.post(url,
        body: {"d1": d1, "d2": d2, "d3": d3, "d4": d4, "d5": d5},
        headers: header);
    final responsePayload = json.decode(response.body);
    print(responsePayload);
    print(responsePayload['result']);
    String result = responsePayload['result'];

    return result;
  }

  @override
  void initState() {
    Spineer = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      drawer: ModalProgressHUD(
        inAsyncCall: showSpineer,
        child: Container(
          height: double.infinity,
          width: 288,
          color: const Color(0xFF17203A),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                      child: Text(
                        'Browse'.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white70),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 24, right: 24),
                      child: Divider(
                        color: Colors.white,
                        height: 1,
                      ),
                    ),
                    Stack(
                      children: [
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 200),
                          height: 56,
                          left: 0,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color(0xff6792ff),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchPar()));
                          },
                          leading: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          title: const Text(
                            "Search",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 24, right: 24),
                      child: Divider(
                        color: Colors.white,
                        height: 1,
                      ),
                    ),
                    Stack(
                      children: [
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 200),
                          height: 56,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color(0xff6792ff),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FavoritePage()));
                          },
                          leading: const Icon(
                            Icons.star,
                            color: Colors.white,
                          ),
                          title: const Text(
                            "favorites",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 24, right: 24),
                      child: Divider(
                        color: Colors.white,
                        height: 1,
                      ),
                    ),
                    Stack(
                      children: [
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 200),
                          height: 56,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color(0xff6792ff),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                        ListTile(
                          onTap: () async {
                            setState(() {
                              showSpineer = true;
                            });
                            Fluttertoast.showToast(
                                msg: "sign out successfully");
                            saveSignInStatus(false);
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            var isSigned = prefs.setString('email','');
                            print(isSigned);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          leading: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          title: const Text(
                            "sign Out",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: Spineer,
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'Select your Symptoms',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'pacifico',
                      color: Colors.deepPurple),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SizedBox(
                    width: 300,
                    child: DropdownButtonFormField<String>(
                      validator: (value) {
                        if (value == null) {
                          return 'Please Select a Symptom';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15)),
                            borderSide:
                            BorderSide(width: 2, color: Colors.deepPurple)),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15)),
                            borderSide:
                            BorderSide(width: 2, color: Colors.deepPurple)),
                        disabledBorder:OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15)),
                            borderSide:
                            BorderSide(width: 2, color: Colors.deepPurple)),
                        errorBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15)),
                            borderSide:
                            BorderSide(width: 2, color: Colors.red)),
                      ),
                      hint: const Text('Select your symptoms',style: TextStyle(color: Colors.deepPurple),),
                      isExpanded: true,
                      value: selectedItem,
                      items: itemsList
                          .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(fontSize: 17),
                              )))
                          .toList(),
                      onChanged: (item) => setState(() {
                        selectedItem = item!;
                      }),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SizedBox(
                    width: 300,
                    child: DropdownButtonFormField<String>(
                      validator: (value) {
                        if (value == null) {
                          return 'Please Select a Sympthom';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15)),
                            borderSide:
                            BorderSide(width: 2, color: Colors.deepPurple)),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15)),
                            borderSide:
                            BorderSide(width: 2, color: Colors.deepPurple)),
                        disabledBorder:OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15)),
                            borderSide:
                            BorderSide(width: 2, color: Colors.deepPurple)),
                        errorBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15)),
                            borderSide:
                            BorderSide(width: 2, color: Colors.red)),
                      ),
                      hint: const Text('Select your symptoms',style: TextStyle(color: Colors.deepPurple),),
                      isExpanded: true,
                      value: selectedItem2,
                      items: itemsList
                          .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(fontSize: 17),
                              )))
                          .toList(),
                      onChanged: (item) => setState(() {
                        selectedItem2 = item!;
                      }),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SizedBox(
                    width: 300,
                    child: DropdownButtonFormField<String>(
                      validator: (value) {
                        if (value == null) {
                          return 'Please Select a Symptom';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15)),
                            borderSide:
                            BorderSide(width: 2, color: Colors.deepPurple)),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15)),
                            borderSide:
                            BorderSide(width: 2, color: Colors.deepPurple)),
                        disabledBorder:OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15)),
                            borderSide:
                            BorderSide(width: 2, color: Colors.deepPurple)),
                        errorBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15)),
                            borderSide:
                            BorderSide(width: 2, color: Colors.red)),
                      ),
                      hint: const Text('Select your symptoms',style: TextStyle(color: Colors.deepPurple),),
                      isExpanded: true,
                      value: selectedItem3,
                      items: itemsList
                          .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(fontSize: 17),
                              )))
                          .toList(),
                      onChanged: (item) => setState(() {
                        selectedItem3 = item!;
                      }),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SizedBox(
                    width: 300,
                    child: DropdownButtonFormField<String>(
                      validator: (value) {
                        if (value == null) {
                          return 'Please Select a Symptom';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(width: 2, color: Colors.deepPurple)),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(width: 2, color: Colors.deepPurple)),
                        disabledBorder:OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15)),
                            borderSide:
                            BorderSide(width: 2, color: Colors.deepPurple)),
                        errorBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15)),
                            borderSide:
                            BorderSide(width: 2, color: Colors.red)),
                      ),
                      hint: const Text('Select your symptoms',style: TextStyle(color: Colors.deepPurple),),
                      isExpanded: true,
                      value: selectedItem4,
                      items: itemsList
                          .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(fontSize: 17),
                              )))
                          .toList(),
                      onChanged: (item) => setState(() {
                        selectedItem4 = item!;
                      }),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SizedBox(
                    width: 300,
                    child: DropdownButtonFormField<String>(
                      validator: (value) {
                        if (value == null) {
                          return 'Please Select a Symptom';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15)),
                            borderSide:
                            BorderSide(width: 2, color: Colors.deepPurple)),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15)),
                            borderSide:
                            BorderSide(width: 2, color: Colors.deepPurple)),
                        disabledBorder:OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15)),
                            borderSide:
                            BorderSide(width: 2, color: Colors.deepPurple)),
                        errorBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15)),
                            borderSide:
                            BorderSide(width: 2, color: Colors.red)),
                      ),
                      hint: const Text('Select your symptoms',style: TextStyle(color: Colors.deepPurple),),
                      isExpanded: true,
                      value: selectedItem5,
                      items: itemsList
                          .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(fontSize: 17),
                              )))
                          .toList(),
                      onChanged: (item) => setState(() {
                        selectedItem5 = item!;
                      }),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(20)),
                child: GestureDetector(
                  onTap: () async {
                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        Spineer = true;
                      });
                      String sm1 = selectedItem!;
                      String sm2 = selectedItem2!;
                      String sm3 = selectedItem3!;
                      String sm4 = selectedItem4!;
                      String sm5 = selectedItem5!;
                      var sm1Key =
                          symptms.keys.firstWhere((k) => symptms[k] == sm1);
                      var sm2Key = symptms.keys.firstWhere(
                        (k) => symptms[k] == sm2,
                      );
                      var sm3Key = symptms.keys.firstWhere(
                        (k) => symptms[k] == sm3,
                      );
                      var sm4Key = symptms.keys.firstWhere(
                        (k) => symptms[k] == sm4,
                      );
                      var sm5Key = symptms.keys.firstWhere(
                        (k) => symptms[k] == sm5,
                      );

                      print(sm1Key);
                      final Result =
                          await addUser(sm1Key, sm2Key, sm3Key, sm4Key, sm5Key);
                      print(Result);
                      // Disease = Result;
                      // getApiData(Disease);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ResultPage(result: Result)));

                      setState(() {
                        Spineer = false;
                      });
                    }
                  },
                  child: const Center(
                      child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
