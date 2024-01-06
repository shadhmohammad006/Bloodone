import 'package:flutter/material.dart';
import 'package:flutter_application_3/const/color.dart';
import 'package:flutter_application_3/controllers/getx_authcontroller.dart';
import 'package:flutter_application_3/utils/custombutton.dart';
import 'package:flutter_application_3/utils/customtextform.dart';
import 'package:flutter_application_3/view/auth/registerpage.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();
  // bool _isDataMatched = true;

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
                "Welcome Back",
                style: TextStyle(
                    color: textcolor,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Signin your account",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextForm(
                controller: authController.loginemail,
                icon: Icons.mail,
                hint: "Email",
                type: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Email';
                  } else {
                    return null;
                  }
                },
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
                  controller: authController.loginpassword,
                  obscuretext: authController.obscuretext.value,
                  icon: Icons.key,
                  hint: "Password",
                  row: true,
                  widget: IconButton(
                      onPressed: () {
                        authController.passwordshowhide();
                      },
                      icon: const Icon(Icons.remove_red_eye)),
                ),
              ),
              const SizedBox(height: 15),
              // Visibility(
              //   visible: !_isDataMatched,
              //   child: Text(
              //     'Username password doesnot match',
              //     style: TextStyle(color: Colors.red),
              //   ),
              // ),
              CustomButton(
                name: authController.loading.value ? "loading..." : "Sign In",
                fn: () {
                  if (_formKey.currentState!.validate()) {
                  } else {
                    print('Data empty');
                  }
                  authController.login(context);
                },
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
                    "Don't have an accoount?",
                    style: TextStyle(color: Colors.grey),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(),
                      ),
                    ),
                    child: Text(
                      "Sign Up",
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
