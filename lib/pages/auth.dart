import 'package:flutter/material.dart';
import 'package:mlmodel/pages/first.dart';
import 'package:mlmodel/pages/sign_up.dart';
import 'package:mlmodel/pages/slide_pages.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../provider/favorite_provider.dart';
import 'btm_nav_bar.dart';


class Auth extends StatefulWidget {

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {





  Future<String?> checkUserState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('email');
    print(savedEmail);
    return savedEmail ;
  }


  @override
  void initState() {
    checkUserState();

    super.initState();
  }

  Widget build(BuildContext context) {

    return FutureBuilder<String?>(
      future: checkUserState(), // Provide the user's email
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          String isUserWithEmail = snapshot.data!;

          if (isUserWithEmail!=null&&isUserWithEmail!='') {
            return BottomNavBar();
          } else {
            return IntroSliderPage();
          }
        }
      },
    );

    //   FutureBuilder(
    //   future: checkSignInStatus(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return CircularProgressIndicator();
    //     }
    //     else if (snapshot.hasError) {
    //       return Text('Error: ${snapshot.error}');
    //     }
    //     else if(snapshot.hasData){
    //       if (isSignedIn!=null) {
    //         return BottomNavBar();
    //       } else {
    //         return LoginScreen();
    //       }
    //
    //     }
    //     return Text('wrong');
    //   },
    // );

  }
}
