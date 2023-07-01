import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mlmodel/models/data_model.dart';
import 'package:mlmodel/widgets/tadial_progress.dart';
import 'constants/disease_food.dart';

class ResultPage extends StatefulWidget {
  ResultPage({required this.result});
  String result;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List<String>? foods;
  getApiData(result) async {
    String Disease = result.trim();
    final url = "https://test1-jp49rrpn9-minagorge1.vercel.app/food/$Disease";
    var response = await http.get(Uri.parse(url));
    Map json = jsonDecode(response.body);
    print(json['food'][0]['food']);
    // print(foodList);
    // foodModel foodList = foodModel(
    //   food1:json['food'][0]['food'][0]['name'],
    //   status1: json['food'][0]['food'][0]['status'],
    //   food2: json['food'][0]['food'][1]['name'],
    //   status2: json['food'][0]['food'][1]['status'],
    //   food3: json['food'][0]['food'][2]['name'],
    //   status3: json['food'][0]['food'][2]['status'],
    //   food4: json['food'][0]['food'][3]['name'],
    //   status4: json['food'][0]['food'][3]['status'],
    //   food5: json['food'][0]['food'][4]['name'],
    //   status5: json['food'][0]['food'][4]['status'],
    //   food6: json['food'][0]['food'][5]['name'],
    //   status6: json['food'][0]['food'][5]['status'],
    // );
    setState(() {
      foods = [
        json['food'][0]['food'][0]['name'],
        json['food'][0]['food'][1]['name'],
        json['food'][0]['food'][2]['name'],
      ];
    });
  }

  @override
  void initState() {
    getApiData(widget.result);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.result),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  widget.result,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 50),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Food allowed for this disease : ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20,),
            foods == null
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.deepPurple,
                    ),
                  )
                : Flexible(
                    child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Container(
                              height: 80,
                              child: Card(
                                child: ListTile(
                                  leading: const Icon(
                                    Icons.restaurant,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                  title: Text(
                                    foods![index].toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff05b7ed),
                                        fontSize: 22),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
          ],
        ));
  }
}
