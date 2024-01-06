import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/const/color.dart';
import 'package:flutter_application_3/controllers/getx_authcontroller.dart';
import 'package:flutter_application_3/utils/custombutton.dart';
import 'package:flutter_application_3/utils/customtextform.dart';
import 'package:flutter_application_3/view/auth/signinpage.dart';

import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final authcontroller = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                "Register",
                style: TextStyle(
                    color: textcolor,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Create your new account",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextForm(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Full Name';
                  } else {
                    return null;
                  }
                },
                controller: authcontroller.name,
                icon: Icons.person,
                hint: "Full Name",
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextForm(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Email Address';
                  } else {
                    return null;
                  }
                },
                controller: authcontroller.email,
                icon: Icons.mail,
                hint: "Email",
                type: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => CustomTextForm(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Password';
                    } else {
                      return null;
                    }
                  },
                  obscuretext: authcontroller.obscuretext.value,
                  controller: authcontroller.password,
                  focusNode: FocusNode(),
                  icon: CupertinoIcons.lock,
                  hint: "Password",
                  row: true,
                  widget: IconButton(
                      onPressed: () {
                        authcontroller.passwordshowhide();
                      },
                      icon: const Icon(Icons.remove_red_eye)),
                ),
              ),
              const SizedBox(height: 15),
              Obx(
                () => CustomButton(
                  name:
                      authcontroller.loading.value ? "loading...." : "Sign Up",
                  fn: () {
                    if (_formKey.currentState!.validate()) {
                    } else {
                      print('Data empty');
                    }
                    authcontroller.signUp(context);
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot password?",
                  style: TextStyle(color: textcolor),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an accoount?",
                    style: TextStyle(color: Colors.grey),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SignInPage(),
                      ),
                    ),
                    child: Text(
                      "SignIn",
                      style: TextStyle(
                          color: textcolor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
