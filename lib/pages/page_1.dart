import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mlmodel/constants/disease_food.dart';
import 'package:mlmodel/pages/detail.dart';
import 'package:mlmodel/pages/favorites.dart';
import 'package:mlmodel/pages/first.dart';
import 'package:mlmodel/pages/search_par.dart';
import 'package:mlmodel/provider/favorite_provider.dart';
import 'package:mlmodel/widgets/customlisttile.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vector_math/vector_math_64.dart' as math;
import 'package:intl/intl.dart';
import 'package:mlmodel/widgets/Ingrediant_progress.dart';
import 'package:mlmodel/widgets/tadial_progress.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    double? breakFastProtin =
        provider.k == 1 ? 0 : provider.BreakfastMeals[0].protin!;
    double? breakFastCarb =
        provider.k == 1 ? 0 : provider.BreakfastMeals[0].carb!;
    double? breakFastCalories =
        provider.k == 1 ? 0 : provider.BreakfastMeals[0].calories!;
    double? breakFastFats =
        provider.k == 1 ? 0 : provider.BreakfastMeals[0].fat!;

    double? DinnerProtin = provider.d == 1 ? 0 : provider.Dinner[0].protin!;
    double? DinnerCarb = provider.d == 1 ? 0 : provider.Dinner[0].carb!;
    double? DinnerCalories = provider.d == 1 ? 0 : provider.Dinner[0].calories!;
    double? DinnerFats = provider.d == 1 ? 0 : provider.Dinner[0].fat!;

    double? LaunchProtin = provider.l == 1 ? 0 : provider.Launch[0].protin!;
    double? LaunchCarb = provider.l == 1 ? 0 : provider.Launch[0].carb!;
    double? LaunchCalories = provider.l == 1 ? 0 : provider.Launch[0].calories!;
    double? LaunchFats = provider.l == 1 ? 0 : provider.Launch[0].fat!;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final today = DateTime.now();
    bool showSpineer = false;
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomePage'),
          centerTitle: true,
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
                        padding: const EdgeInsets.only(
                            left: 24, top: 32, bottom: 16),
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
                            leading: Icon(
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
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              var isSigned = prefs.setString('email', '');
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
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(
                      top: 50, left: 32, right: 16, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          "${DateFormat("EEEE").format(today)} , ${DateFormat("d MMMM").format(today)}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Color(0xff05b7ed)),
                        ),
                        subtitle: const Text(
                          "Hello",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 26,
                            color: Color(0xff05b7ed),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          RadialProgress(
                            value: breakFastCalories.toInt() +
                                DinnerCalories.toInt() +
                                LaunchCalories.toInt(),
                            width: width * .4,
                            height: width * .4,
                            progress: breakFastCalories / 10000 +
                                DinnerCalories / 10000 +
                                LaunchCalories / 10000,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              IngredientProgress(
                                Ingredient: "Protine",
                                leftAmount: breakFastProtin.toInt() +
                                    DinnerProtin.toInt() +
                                    LaunchProtin.toInt(),
                                progress: breakFastProtin / 1000 +
                                    DinnerProtin / 1000 +
                                    DinnerProtin / 1000,
                                progressColor: Colors.green,
                                width: width * .28,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              IngredientProgress(
                                Ingredient: "Carbs",
                                leftAmount: breakFastCarb.toInt() +
                                    DinnerCarb.toInt() +
                                    LaunchCarb.toInt(),
                                progress: breakFastCarb / 1000 +
                                    DinnerCarb / 1000 +
                                    LaunchCarb / 1000,
                                progressColor: Colors.red,
                                width: width * .28,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              IngredientProgress(
                                Ingredient: "Fats",
                                leftAmount: breakFastFats.toInt() +
                                    DinnerFats.toInt() +
                                    LaunchFats.toInt(),
                                progress: breakFastFats / 1000 +
                                    DinnerFats / 1000 +
                                    LaunchFats / 1000,
                                progressColor: Colors.yellow,
                                width: width * .28,
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomListTile(
              ontap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    Detail(
                      calories: provider.BreakfastMeals[0].calories!.toInt(),
                      carbo: provider.BreakfastMeals[0].carb!.toInt(),
                      protin: provider.BreakfastMeals[0].protin!.toInt(),
                      RecipeTitle: provider.BreakfastMeals[0].label,
                      image: provider.BreakfastMeals[0].image.toString(),
                      ingredients: provider.BreakfastMeals[0].ingredients,)));
              },
              Title: provider.k == 1
                  ? 'BreakFast'
                  : provider.BreakfastMeals[0].label,
              ImageName: provider.k == 1
                  ? Image.asset('assets/home_screen/icon1.png')
                  : Image.network(provider.BreakfastMeals[0].image.toString()),
              icon: provider.k == 1
                  ? IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchPar()));
                      },
                      icon: const Icon(
                        Icons.add_circle,
                        size: 30,
                        color: Color(0xff05b7ed),
                      ))
                  : IconButton(
                      onPressed: () {
                        provider.clearBreak();
                        provider.k = 1;
                      },
                      icon: const Icon(
                        Icons.delete,
                        size: 30,
                        color: Color(0xff05b7ed),
                      ),
                    ),
              SelectFood: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPar()));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomListTile(
              ontap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    Detail(
                      calories: provider.Dinner[0].calories!.toInt(),
                      carbo: provider.Dinner[0].carb!.toInt(),
                      protin: provider.Dinner[0].protin!.toInt(),
                      RecipeTitle: provider.Dinner[0].label,
                      image: provider.Dinner[0].image.toString(),
                      ingredients: provider.Dinner[0].ingredients,)));
              },
              Title: provider.d == 1 ? 'Launch' : provider.Dinner[0].label,
              ImageName: provider.d == 1
                  ? Image.asset('assets/home_screen/icon2.png')
                  : Image.network(provider.Dinner[0].image.toString()),
              icon: provider.d == 1
                  ? IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchPar()));
                      },
                      icon: const Icon(
                        Icons.add_circle,
                        size: 30,
                        color: Color(0xff05b7ed),
                      ))
                  : IconButton(
                      onPressed: () {
                        provider.clearDinner();
                        provider.d = 1;
                      },
                      icon: const Icon(
                        Icons.delete,
                        size: 30,
                        color: Color(0xff05b7ed),
                      ),
                    ),
              SelectFood: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPar()));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomListTile(
              ontap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    Detail(
                      calories: provider.Launch[0].calories!.toInt(),
                      carbo: provider.Launch[0].carb!.toInt(),
                      protin: provider.Launch[0].protin!.toInt(),
                      RecipeTitle: provider.Launch[0].label,
                      image: provider.Launch[0].image.toString(),
                      ingredients: provider.Launch[0].ingredients,)));
              },
              Title: provider.l == 1 ? 'Dinner' : provider.Launch[0].label,
              icon: provider.l == 1
                  ? IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchPar()));
                      },
                      icon: const Icon(
                        Icons.add_circle,
                        size: 30,
                        color: Color(0xff05b7ed),
                      ))
                  : IconButton(
                      onPressed: () {
                        provider.clearLaunch();
                        provider.l = 1;
                      },
                      icon: const Icon(
                        Icons.delete,
                        size: 30,
                        color: Color(0xff05b7ed),
                      ),
                    ),
              ImageName: provider.l == 1
                  ? Image.asset('assets/home_screen/icon3.png')
                  : Image.network(provider.Launch[0].image.toString()),
              SelectFood: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPar()));
              },
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
