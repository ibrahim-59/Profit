import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mlmodel/models/data_model.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteProvider extends ChangeNotifier {
  List<receipeModel> _BreakFastMeals = [];
  List<receipeModel>_Dinner = [];
  List<receipeModel>_launch = [];
  List<receipeModel>get Dinner  => _Dinner;
  List<receipeModel> get BreakfastMeals => _BreakFastMeals;
  List<receipeModel>get Launch  => _launch;
  int k=1;
  int d=1;
  int l = 1;






  void addBreakfast(receipeModel data){
    _BreakFastMeals.add(data);
    notifyListeners();
  }
  void clearBreak(){
    _BreakFastMeals=[];
    notifyListeners();
  }
  void addDinner(receipeModel data){
    _Dinner.add(data);
    notifyListeners();
  }
  void clearDinner(){
    _Dinner=[];
    notifyListeners();
  }
  void addLaunch(receipeModel data){
    _launch.add(data);
    notifyListeners();
  }
  void clearLaunch(){
    _launch = [];
    notifyListeners();
  }




  // Future<void> toggleFavorite(String label,String image,int calories , int carb , int protin , List<dynamic> ingrediants) async {
  //   final isExist = _labels.contains(label) && _FavoriteData.contains(label);
  //   // SharedPreferences prefs = await SharedPreferences.getInstance();
  //   // String? savedEmail = prefs.getString('email');
  //   if (isExist) {
  //     //await FirebaseFirestore.instance.collection('users').doc(savedEmail).collection('foods').doc(label).delete();
  //     _labels.remove(label);
  //     _favorimage.remove(image);
  //     _calories.remove(calories);
  //     _carb.remove(carb);
  //     _protin.remove(protin);
  //     _ing.remove(ingrediants);
  //
  //   } else {
  //     // await FirebaseFirestore.instance.collection('users').doc(savedEmail).collection('foods').doc(label).set({
  //     //   'name':label,
  //     //   'image' : image ,
  //     //   'calories' : calories,
  //     //   'carb' : carb,
  //     //   'protin' : protin,
  //     //   'ingredients' : ingrediants
  //     // });
  //     _favorimage.add(image.toString());
  //     _labels.add(label.toString());
  //     _protin.add(protin);
  //     _carb.add(carb);
  //     _calories.add(calories );
  //     _ing.add(ingrediants);
  //
  //   }
  //   notifyListeners();
  // }



  Future<void> saveSignInStatus(bool isSignedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isSignedIn', isSignedIn);
  }









  static FavoriteProvider of(
      BuildContext context, {
        bool listen = true,
      }) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}