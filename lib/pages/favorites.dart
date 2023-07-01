import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mlmodel/pages/detail.dart';
import 'package:mlmodel/pages/recipe_page.dart';
import 'package:mlmodel/provider/favorite_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyData {
  final String url;
  final String name;
  final String image;

  MyData({
    required this.url,
    required this.name,
    required this.image,
  });
}

class FavoritePage extends StatefulWidget {
  FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  String Email = '';
  String? name;
  bool _isLoading = false;

  @override
  initState() {
    myEmail();
    super.initState();
  }

  myEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      Email = (prefs.getString('email') ?? '');
    });
  }

  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);


    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorities'),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body:StreamBuilder<QuerySnapshot>(
          builder: (context, snapshots) {
            if (snapshots.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshots.connectionState == ConnectionState.active) {
              if (snapshots.data!.docs.isNotEmpty) {
                return ListView.builder(
                    itemCount: snapshots.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Detail(
                                        calories: snapshots.data!.docs[index]
                                            ['calories'],
                                        carbo: snapshots.data!.docs[index]
                                            ['carb'],
                                        protin: snapshots.data!.docs[index]
                                            ['protin'],
                                        RecipeTitle: snapshots.data!.docs[index]
                                            ['name'],
                                        image: snapshots.data!.docs[index]
                                            ['image'],
                                        ingredients: snapshots.data!.docs[index]
                                            ['ingredients'])));
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title:
                                    Text(snapshots.data!.docs[index]['name']),
                                trailing: IconButton(
                                  onPressed: () async {
                                    await FirebaseFirestore.instance.collection(Email).doc(snapshots.data!.docs[index]['name']).delete();
                                  },
                                  icon: const Icon(Icons.delete_outline,
                                      color: Colors.red),
                                ),
                                leading: Image.network(
                                    snapshots.data!.docs[index]['image']),
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return const Center(child: Text("No tasks has been uploaded"));
              }
            }
            return const Center(child: Text("Something went wrong"));
          },
          stream: FirebaseFirestore.instance.collection(Email!).snapshots(),
        ));

    //   ListView.builder(
    //     itemCount: Meals.length,
    //     itemBuilder: (context, index) {
    //       final word = provider.labels[index];
    //       final image = provider.images[index];
    //       final ingredients = provider.ing[index];
    //       final protin = provider.protin[index];
    //       final carb = provider.carb[index];
    //       final calories = provider.calories[index];
    //       return Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: InkWell(
    //           onTap: () {
    //             Navigator.push(
    //                 context,
    //                 MaterialPageRoute(
    //                     builder: (context) => Detail(
    //                         calories: calories,
    //                         carbo: carb,
    //                         protin: protin,
    //                         RecipeTitle: word,
    //                         image: image,
    //                         ingredients: ingredients)));
    //           },
    //           child: Card(
    //             child: Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: ListTile(
    //                 title: Text(word),
    //                 trailing: IconButton(
    //                   onPressed: () {
    //                     provider.toggleFavorite(
    //                       word,
    //                       image.toString(),
    //                       calories.toInt(),
    //                       carb.toInt(),
    //                       protin.toInt(),
    //                       ingredients,
    //                     );
    //                   },
    //                   icon: provider.isExist(word)
    //                       ? const Icon(Icons.favorite, color: Colors.red)
    //                       : const Icon(Icons.favorite_border),
    //                 ),
    //                 leading: Image.network(image.toString()),
    //               ),
    //             ),
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
