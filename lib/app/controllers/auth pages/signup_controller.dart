import 'package:fabb_mobil/app/models/user_model.dart';
import 'package:fabb_mobil/app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  RxString firstname = ''.obs;
  RxString lastname = ''.obs;
  RxString phonenumber = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxBool isPasswordHidden = true.obs;
  RxString displayText = 'Enter a password'.obs;

  late TextEditingController firstnameTEController,
      lastnameTEController,
      phoneNumberTEController;
  late TextEditingController emailController, passwordController;
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    firstnameTEController = TextEditingController();
    lastnameTEController = TextEditingController();
    phoneNumberTEController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    Get.lazyPut(() => SignupController());
  }

  User createUser() {
    return User(
      fullName: firstname.value +
          lastname.value, // database'de full name'in arasında boşlık yok !!
      phoneNumber: phonenumber.value,
      email: email.value,
      password: password.value,
    );
  }

  Future<bool> register() async {
    //print(AuthService().postRegister(createUser()));
    bool isRegistered = await AuthService().postRegister(createUser());

    if (isRegistered) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void onClose() {
    firstnameTEController.text = "";
    lastnameTEController.text = "";
    phoneNumberTEController.text = "";
    emailController.text = "";
    passwordController.text = "";
    firstnameTEController.dispose();
    lastnameTEController.dispose();
    phoneNumberTEController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid email";
    }
    return null;
  }

  String? validatePassword(value) {
    if (value.length < 6) {
      return "Password must be longer than 6 characters";
    }
    return null;
  }

  String? validateFullName(String value) {
    if (value.length < 2) {
      return "Name must be longer than 1 character";
    }
    return null;
  }

  String? validatePhoneNumber(String value) {
    if (!GetUtils.isPhoneNumber(value)) {
      return "Provide valid number";
    }
    return null;
  }

  @override
  void dispose() {
    Get.delete<SignupController>();
    super.dispose();
  }
}
