import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/controllers/getx_authcontroller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../const/color.dart';

class Settings extends StatelessWidget {
  Settings({super.key});
  final authController = Get.put(AuthController());

  final List<String> options = ['Logout', 'Delete Account'];

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: maincolor,
        title: Center(
          child: Text(
            "Settings",
            style: TextStyle(
              color: lightcolor,
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: maincolor,
                child: user?.photoURL != null
                    ? ClipOval(
                        child: Image.network(
                          user!.photoURL!,
                          fit: BoxFit.fill,
                          width: 100,
                          height: 100,
                        ),
                      )
                    : Icon(
                        Icons.person,
                        size: 70,
                      ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              user?.email ?? 'Guest',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: options.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(options[index]),
                  onTap: () {
                    // Handle item tap based on index
                    switch (index) {
                      case 0:
                        // Logout logic
                        authController.logout(context);
                        break;
                      case 1:
                        // Delete Account logic
                        authController.DeleteAccount(context);
                        break;

                      // Add more cases for additional options if needed
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
