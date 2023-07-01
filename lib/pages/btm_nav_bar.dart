import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mlmodel/MlModel.dart';
import 'package:mlmodel/constants/disease_food.dart';
import 'package:mlmodel/pages/favorites.dart';
import 'package:mlmodel/pages/first.dart';
import 'package:mlmodel/pages/page_1.dart';
import 'package:mlmodel/pages/search_par.dart';
import 'package:mlmodel/provider/favorite_provider.dart';
import 'package:provider/provider.dart';
class BottomNavBar extends StatefulWidget {
  static String id = 'HomeScreen';
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}
class _BottomNavBarState extends State<BottomNavBar> {
  bool _switch = false;
  bool isactive = false;
  bool isactivetwo = false;
  String? _Username ;
  List Screens = [
    HomeScreen(),
    MlModel(),
  ];
  int _selectedIndex = 1;


  
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      drawer: Container(
        height: double.infinity,
        width: 288,
        color: Color(0xFF17203A),
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
                        duration: Duration(milliseconds: 200),
                        height: 56,
                        left: 0,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xff6792ff),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPar()));
                        },
                        leading: Icon(Icons.search,color: Colors.white,),
                        title: Text(
                          "Search",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10,),
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
                        duration: Duration(milliseconds: 200),
                        height: 56,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xff6792ff),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritePage()));
                        },
                        leading: Icon(Icons.star,color: Colors.white,),
                        title: Text(
                          "favorites",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10,),
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
                        duration: Duration(milliseconds: 200),
                        height: 56,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xff6792ff),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                        ),
                      ),
                      ListTile(
                        onTap: ()async {
                          Fluttertoast.showToast(msg: "sign out successfully");
                          saveSignInStatus(true);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>LoginScreen() ));
                        },
                        leading: Icon(Icons.arrow_back,color: Colors.white,),
                        title: Text(
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

      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.deepPurple,
        index: _selectedIndex,
        height: 50,
        items: const [
          Icon(Icons.restaurant,color: Colors.white,),
          Icon(Icons.home,color: Colors.white,),
        ],
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Colors.transparent,
      ),
      body: Screens[_selectedIndex],
    );
  }
}


