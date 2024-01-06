import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/const/color.dart';
import 'package:connectivity/connectivity.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  FirebaseAuth auth = FirebaseAuth.instance;
  

Future<bool> isNetworkAvailable() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult != ConnectivityResult.none;
}


  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context,
          auth.currentUser?.uid != null ? '/Bottomnavbar' : '/RegisterPage');
    });
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/images/Screenshot_2024-01-02_162154-removebg-preview.png',
              height: 400,
            ),
            Text(
              'Save Life',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              'Give Blood',
              style: TextStyle(
                  color: textcolor, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
