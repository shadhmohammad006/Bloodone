import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/utils/custombutton.dart';
import 'package:flutter_application_3/utils/customtextform.dart';
import 'package:get/get.dart';

import '../const/color.dart';

class AddDonor extends StatelessWidget {
  AddDonor({super.key});
  final bloodGroups = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  String? selectedGroup;
  TextEditingController donorName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();

  final donorDetails = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection("donorDetails");

  void addDonor() {
    final data = {
      'Donor Name': donorName.text,
      'Mobile Number': mobileNumber.text,
      'Blood Group': selectedGroup
    };
    donorDetails.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: maincolor,
        title: Center(
            child: Text(
          "Add Donor",
          style: TextStyle(
              color: lightcolor, fontWeight: FontWeight.bold, fontSize: 26),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            CustomTextForm(
              controller: donorName,
              icon: CupertinoIcons.person,
              hint: 'Donor Name',
              type: TextInputType.name,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextForm(
              controller: mobileNumber,
              icon: CupertinoIcons.phone,
              hint: 'Mobile Number',
              type: TextInputType.phone,
              // maxLength: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Blood Group'),
                items: bloodGroups
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                onChanged: (val) {
                  selectedGroup = val as String?;
                }),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              name: 'Save Details',
              fn: () {
                addDonor();
                Navigator.popAndPushNamed(context, '/Bottomnavbar');
              },
            )
          ],
        ),
      ),
    );
  }
}
