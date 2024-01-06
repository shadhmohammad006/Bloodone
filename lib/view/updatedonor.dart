import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/utils/custombutton.dart';
import 'package:flutter_application_3/utils/customtextform.dart';
import 'package:get/get.dart';

import '../const/color.dart';

class UpdateDonor extends StatefulWidget {
  UpdateDonor({super.key});

  @override
  State<UpdateDonor> createState() => _UpdateDonorState();
}

class _UpdateDonorState extends State<UpdateDonor> {
  final bloodGroups = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];

  String? selectedGroup;

  TextEditingController donorName = TextEditingController();

  TextEditingController mobileNumber = TextEditingController();

  final donorDetails = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection("donorDetails");

  void updateDonor(docId) {
    final data = {
      "Donor Name": donorName.text,
      "Mobile Number": mobileNumber.text,
      "Blood Group": selectedGroup,
    };
    donorDetails.doc(docId).update(data).then((value) => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    donorName.text = args['donorName'];
    mobileNumber.text = args['mobileNumber'];

    selectedGroup = args['bloodGroup'];
    final docId = args['id'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: maincolor,
        title: Center(
            child: Text(
          "Update Donor",
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
              maxLength: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
                value: selectedGroup,
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
              name: 'Update Details',
              fn: () {
                updateDonor(docId);
              },
            )
          ],
        ),
      ),
    );
  }
}
