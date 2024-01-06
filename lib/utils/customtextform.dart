import 'package:flutter/material.dart';
import 'package:flutter_application_3/const/color.dart';

class CustomTextForm extends StatelessWidget {
  CustomTextForm(
      {super.key,
      required this.icon,
      this.controller,
      required this.hint,
      this.row = false,
      this.focusNode,
      this.type,
      this.obscuretext = false,
      this.validator,
      this.maxLength,
      this.widget = const SizedBox()});
  IconData icon;
  TextEditingController? controller;
  String hint;
  bool row = false;
  dynamic validator;
  dynamic maxLength;
  FocusNode? focusNode;
  TextInputType? type;
  bool obscuretext = false;
  Widget widget = const SizedBox();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 52,
        width: double.infinity,
        decoration: BoxDecoration(
            color: lightcolor, borderRadius: BorderRadius.circular(12)),
        child: Row(children: [
          Expanded(
              child: TextFormField(
            validator: validator,
            maxLength: maxLength,
            obscureText: obscuretext,
            focusNode: focusNode,
            keyboardType: type,
            controller: controller,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: textcolor),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                prefixIcon: Icon(
                  icon,
                  color: buttoncolor,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          )),
          row == true ? widget : const SizedBox()
        ]));
  }
}
