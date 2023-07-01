import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mlmodel/pages/splash_screen.dart';
import 'package:mlmodel/provider/favorite_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override

  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  bool isSignedIn = false;

  @override
  // void initState() {
  //   super.initState();
  //   checkSignInStatus();
  // }
  // Future<void> checkSignInStatus() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool signedIn = prefs.getBool('isSignedIn') ?? false;
  //   setState(() {
  //     isSignedIn = signedIn;
  //   });
  // }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => FavoriteProvider(),
        builder: (context , child){
          final provider = Provider.of<FavoriteProvider>(context);
          return MaterialApp(
            home:SplashScreen(),
            // isSignedIn?BottomNavBar():IntroSliderPage(),
            debugShowCheckedModeBanner: false,

          );
        }
    );
  }
}

