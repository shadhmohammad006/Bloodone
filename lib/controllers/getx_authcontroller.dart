import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/usermodel.dart';
import 'package:flutter_application_3/view/auth/registerpage.dart';
import 'package:flutter_application_3/view/auth/signinpage.dart';
import 'package:flutter_application_3/view/bottomnavbar.dart';
import 'package:get/get.dart';

import '../view/mainpage.dart';

class AuthController extends GetxController {
  
  // 1 create instance

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  // user register controllers
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
// user login controllers
  TextEditingController loginemail = TextEditingController();
  TextEditingController loginpassword = TextEditingController();

  var loading = false.obs;
  var obscuretext = false.obs;

  //////////////////////////////////    signup     //////////////////////////////////////////

  signUp(context) async {
    loading.value = true;
    try {
      await auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);

      await addUserData(UserModel(
          name: name.text, email: email.text, id: auth.currentUser?.uid));
      loading.value = false;
      // Get.offAll((page) =>  MainPage());
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => BottomNavBar(),
        ),
      );
    } catch (e) {
      loading.value = false;
      Get.snackbar("error", "$e");
    }
  }

///////////////////////    store user data cloud firestore     ///////////////////////////////
  ///
  ///
  addUserData(UserModel userModel) async {
    try {
      await db
          .collection("users")
          .doc(auth.currentUser?.uid)
          .collection("userdetails")
          .add(userModel.toMap());
    } catch (e) {
      Get.snackbar("error", "$e");
    }
  }

  //   ///////////////////////       logout      ///////////////////////////////
  logout(context) async {
    try {
      await auth.signOut();
     Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => SignInPage()), (route) => false);
    } catch (e) {
      Get.snackbar("Error", "$e");
    }
  }

  /////////////////////      login    //////////////////////////
  login(context) async {
    loading.value = true;
    try {
      await auth.signInWithEmailAndPassword(
          email: loginemail.text, password: loginpassword.text);

      loading.value = false;
      // Get.offAll((page) => MainPage());
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => BottomNavBar(),
        ),
      );
    } catch (e) {
      loading.value = false;
      Get.snackbar("Error", "$e");
    }
  }

  //////////////////////////     deleteAccount     ////////////////////////




 

  DeleteAccount(context) async {
    try {
      deleteUserDetails(context);
      deletDonorDetails(context);
      // Delete user account from Authentication
      await auth.currentUser?.delete();
       // Navigate to the sign-in page after successful deletion
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => RegisterPage(),
        ),
      );
    } catch (e) {
      Get.snackbar("error", "$e");
    }
  }

/////////////////////////////////////////////////////////////
  Future<void> deleteUserDetails(context) async {
    try {
      // Delete user data from Firestore
      await db
          .collection("users")
          .doc(auth.currentUser?.uid)
          .collection("userdetails")
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          doc.reference.delete();
        });
      });

   
    } catch (e) {
      Get.snackbar("Error", "$e");
    }
  }
  ////////////////////////////////////////////////////////////////////////////

  Future<void> deletDonorDetails(context) async {
    try {
      // Delete user data from Firestore
      await db
          .collection("users")
          .doc(auth.currentUser?.uid)
          .collection("donorDetails")
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          doc.reference.delete();
        });
      });

      

     
    } catch (e) {
      Get.snackbar("Error", "$e");
    }
  }
 

  //////////////////////////     passwordsohwhide     ////////////////////////
  passwordshowhide() {
    obscuretext.value = !obscuretext.value;
  }
}
