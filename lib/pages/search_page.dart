import 'dart:convert';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mlmodel/models/data_model.dart';
import 'package:mlmodel/pages/detail.dart';
import 'package:mlmodel/provider/favorite_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchPage extends StatefulWidget {
  String? search;
  SearchPage({this.search});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<receipeModel> list = <receipeModel>[];


  getApiData(search) async {
    final url =
        "https://api.edamam.com/search?q=$search&app_id=700d9571&app_key=567b33c51968dcfadfd6401c7342e695&from=0&to=5&calories=591-722&health=alcohol-free";
    var response = await http.get(Uri.parse(url));
    Map json = jsonDecode(response.body);
    print(json);
    json['hits'].forEach((e) {
      receipeModel recipe = receipeModel(
          url: e['recipe']['url'],
          image: e['recipe']['image'],
          source: e['recipe']['source'],
          label: e['recipe']['label'],
          protin: e['recipe']['digest'][2]['total'],
          fat: e['recipe']['digest'][0]['total'],
          calories: e['recipe']['calories'],
          carb: e['recipe']['digest'][1]['total'],
          count: json['count'],
          ingredients: e['recipe']['ingredientLines']);
      setState(() {
        list.add(recipe);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApiData(widget.search);
    print(list.length);
  }

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: list.isEmpty
          ? const Center(
              child:  Text(
              'There is no items ',
              style: TextStyle(color: Colors.deepPurple, fontSize: 30),
            ))
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, i) {
                final x = list[i];
                final word = x.label.toString();
                receipeModel items = receipeModel(
                    image: x.image.toString(),
                    url: x.url.toString(),
                    label: x.label.toString(),
                    protin: x.protin,
                    carb: x.carb,
                    calories: x.calories,
                    fat: x.fat,
                    ingredients: x.ingredients);
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Detail(
                                        ingredients: x.ingredients,
                                        calories: x.calories!.toInt(),
                                        carbo: x.carb!.toInt(),
                                        protin: x.protin!.toInt(),
                                        RecipeTitle: x.label,
                                        image: x.image)));
                          },
                          child: Column(
                            children: [
                              Container(
                                  decoration: const BoxDecoration(
                                    borderRadius:  BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                  ),
                                  height: 250,
                                  width: double.infinity,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                    child: Image.network(
                                      x.image.toString(),
                                      fit: BoxFit.fill,
                                    ),
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        x.label.toString(),
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      PopupMenuButton(
                                        onSelected: (item) =>
                                            selectedItem(context, item, items),
                                        itemBuilder: (context) => [
                                          const PopupMenuItem<int>(
                                              value: 0,
                                              child: Text('AddToBreakfast')),
                                          const PopupMenuItem<int>(
                                              value: 1,
                                              child: Text('AddToDinner')),
                                          const PopupMenuItem<int>(
                                              value: 2,
                                              child: Text('AddToLaunch')),
                                          const PopupMenuItem<int>(
                                              value: 3,
                                              child: Text('AddToFavorite')),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                thickness: 5,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        )
                      ],
                    ));
              }),
    );
  }

  selectedItem(BuildContext context, item, receipeModel items) async {
    final provider = FavoriteProvider.of(context, listen: false);
    switch (item) {
      case 0:
        provider.addBreakfast(items);
        provider.k = 0;
        print(provider.BreakfastMeals[0].label);
        Navigator.pop(context);
        Navigator.pop(context);

        break;
      case 1:
        provider.addLaunch(items);
        provider.l = 0;
        print(provider.Dinner[0].label);
        Navigator.pop(context);
        Navigator.pop(context);
        break;
      case 2:
        provider.addDinner(items);
        provider.d = 0;
        Navigator.pop(context);
        Navigator.pop(context);
        print("Case 2");
        break;
      case 3:
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String? savedEmail = prefs.getString('email');
        await FirebaseFirestore.instance.collection(savedEmail!).doc(items.label.toString()).set({
          'name':items.label.toString(),
          'image' : items.image.toString() ,
          'calories' : items.calories!.toInt(),
          'carb' : items.carb!.toInt(),
          'protin' : items.protin!.toInt(),
          'ingredients' : items.ingredients,
        });
        Navigator.pop(context);
        Navigator.pop(context);
    }
  }

}
