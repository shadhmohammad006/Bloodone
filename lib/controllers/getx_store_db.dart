// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';

// class StoreDb extends GetxController {
//  // Function to store Google signed user name and email in Firestore
// Future<void> storeCartData({required donorName,required mobileNumber,required bloodGroup }) async {
//   // Check if the user is signed in
//   User? user = FirebaseAuth.instance.currentUser;
//   if (user != null) {
//     // Get user data
//     String donorName = donorName ?? "";
//     String mobileNumber = mobileNumber ?? "";
//     String bloodGroup = bloodGroup ?? "";
   


//     // Get a reference to the Firestore database
//     FirebaseFirestore firestore = FirebaseFirestore.instance;

//     // Create a document reference in the 'users' collection with the user's UID
//     DocumentReference userRef = firestore.collection('User').doc(user.uid).collection('Cart').doc(cartName);

//     // Set the user data in the document
//     try {
//       await userRef.set({
//         'donorName': donorName,
//         'mobileNumber': mobileNumber,
//         'bloodGroup': bloodGroup,
        
//       });

//       print('Cart data stored successfully in Firestore!');
//     } catch (error) {
//       print('Error storing Cart data: $error');
//     }
//   } else {
//     print('Cart is not signed in.');
//   }
// }
// }
