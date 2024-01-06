import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/const/color.dart';
import 'package:flutter_application_3/controllers/getx_authcontroller.dart';

import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final authController = Get.put(AuthController());

  final donorDetails = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection("donorDetails");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: maincolor,
        title: Center(
            child: Text(
          "Bloodone",
          style: TextStyle(
              color: lightcolor, fontWeight: FontWeight.bold, fontSize: 26),
        )),
      ),
      body: StreamBuilder(
          stream: donorDetails.snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, Index) {
                    final DocumentSnapshot donorsnap =
                        snapshot.data.docs[Index];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 250, 191, 191),
                                  blurRadius: 10,
                                  spreadRadius: 10)
                            ],
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: CircleAvatar(
                                    backgroundColor: maincolor,
                                    radius: 30,
                                    child: Text(
                                      donorsnap['Blood Group'],
                                      style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                          color: lightcolor),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      donorsnap['Donor Name'],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      donorsnap['Mobile Number'].toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/Updatedonor',
                                        arguments: {
                                          'donorName': donorsnap['Donor Name'],
                                          'mobileNumber':
                                              donorsnap['Mobile Number']
                                                  .toString(),
                                          'bloodGroup':
                                              donorsnap['Blood Group'],
                                          'id': donorsnap.id
                                        });
                                  },
                                  icon: Icon(Icons.edit),
                                  iconSize: 30,
                                  color: Colors.blueGrey,
                                ),
                                IconButton(
                                  onPressed: () {
                                    deleteDonor(donorsnap.id);
                                  },
                                  icon: Icon(Icons.delete),
                                  iconSize: 30,
                                  color: Colors.red,
                                )
                              ]),
                        ),
                      ),
                    );
                  });
            }
            return Container();
          }),
    );
  }

  void deleteDonor(docId) {
    donorDetails.doc(docId).delete();
  }
}
