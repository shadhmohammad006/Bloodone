import 'package:flutter/material.dart';
import 'package:flutter_application_3/const/color.dart';

class NoNetworkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.signal_wifi_off,
              size: 100,
              color: Colors.red, // Choose your desired color
            ),
            Text(
              'No internet connection. Please check your network settings.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: textcolor),
            ),
          ],
        ),
      ),
    );
  }
}
