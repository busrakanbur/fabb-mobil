import 'package:fabb_mobil/app/modules/auth_pages/controller/auth_controller.dart';
import 'package:fabb_mobil/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignupView extends GetView<AuthController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
        ),
        body: Container(
            alignment: Alignment.center,
            height: Get.height,
            width: Get.width,
            padding: const EdgeInsets.symmetric(horizontal: 60),
            color: Colors.white,
            child: SingleChildScrollView(
              child: Form(
                  child: Column(
                children: [
                  signupPageTitle(),
                  signupTextFormField('First Name', Icons.person),
                  signupTextFormField('Last Name', Icons.person),
                  signupTextFormField('Phone Number', Icons.phone),
                  signupTextFormField('E-mail', Icons.mail),
                  signupTextFormField('Password', Icons.lock),
                  signupButton(),
                  alreadyHaveAnAccountText()
                ],
              )),
            )),
      ),
    );
  }

  GestureDetector alreadyHaveAnAccountText() {
    return GestureDetector(
        onTap: () {
          Get.toNamed('/login');
        },
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            'Already have an account? Login',
            style:
                TextStyle(fontSize: 13, color: Color.fromARGB(255, 81, 81, 81)),
          ),
        ));
  }

  GestureDetector signupButton() {
    return GestureDetector(
      onTap: () {
        Get.defaultDialog(
            title: "Done!",
            titleStyle: TextStyle(color: Colors.white),
            backgroundColor: Color.fromARGB(255, 41, 41, 41),
            content: Text('Succesfully created an account.',
                style: TextStyle(color: Colors.white)));
        //Get.toNamed('/login');
      },
      child: Container(
        margin: EdgeInsets.only(top: 30),
        alignment: Alignment.center,
        height: 50,
        width: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color.fromARGB(255, 54, 54, 54)),
        child: Text(
          "SIGN UP",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  Container signupTextFormField(String hintText, IconData icon) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(20),
      height: 9.h,
      width: 90.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.transparent,
          border: Border.all(color: Color.fromARGB(255, 106, 106, 106))),
      child: TextFormField(
        onChanged: (value) {},
        decoration: InputDecoration(
            icon: Icon(icon),
            border: UnderlineInputBorder(),
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 13)),
      ),
    );
  }

  Text signupPageTitle() {
    return Text('SIGN UP',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300));
  }
}


// Text(
//                     controller.displayText.value,
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: controller.passwordStrength.value <= 1 / 4
//                           ? Colors.red
//                           : controller.passwordStrength.value == 2 / 4
//                               ? Colors.amber
//                               : controller.passwordStrength.value == 3 / 4
//                                   ? Colors.deepPurpleAccent
//                                   : Colors.green,
//                     ),
//                   ),