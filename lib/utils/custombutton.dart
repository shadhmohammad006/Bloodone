import 'package:flutter/material.dart';
import '../const/color.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.name, this.fn});
  String name;
  void Function()? fn;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fn,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: buttoncolor),
        child: Text(
          name,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
