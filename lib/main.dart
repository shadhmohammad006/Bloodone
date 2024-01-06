import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_3/const/color.dart';
import 'package:flutter_application_3/firebase_options.dart';
import 'package:flutter_application_3/view/auth/registerpage.dart';
import 'package:flutter_application_3/view/bottomnavbar.dart';
import 'package:flutter_application_3/view/mainpage.dart';
import 'package:flutter_application_3/view/splash_screen.dart';
import 'package:flutter_application_3/view/updatedonor.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "bloodone",
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData(
        textTheme: TextTheme(
            displayLarge: TextStyle(
                color: textcolor, fontWeight: FontWeight.bold, fontSize: 26)),
        scaffoldBackgroundColor: lightcolor,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
      ),
      routes: {
        '/': (context) => SplashScreen(),
        '/RegisterPage': (context) => RegisterPage(),
        '/MainPage': (context) => MainPage(),
        '/Bottomnavbar': (context) => BottomNavBar(),
        '/Updatedonor': (context) => UpdateDonor()
      },

      //auth.currentUser?.uid != null? MainPage():
      // RegisterPage()
    );
  }
}
