// ignore_for_file: prefer_const_constructors

import 'package:charities/modules/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../modules/homePage.dart';
import '../modules/signinpage.dart';
import 'SignUpController.dart';

// import 'package:phone_auth_firebase_last/views/hoem_screen.dart';
class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;
  var verId = '';
  var authStatus = ''.obs;
  RxBool isError = false.obs;
  bool? isPassword=false;
  // final SignUpController loginController = Get.find();
  var auth = FirebaseAuth.instance;
  final box = GetStorage();
  void signIn(String email, String password) {
    isLoading.value = true;
    auth
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then(
      (userCredential) {
        var user = userCredential.user;
        if (user != null) {
          // loginController.getUserdata(user.uid);
          box.write('userId', user.uid);
          Get.offAll(
            () => Home(),
          );
          isLoading.value = false;
          emailController.text = '';
          passwordController.text = '';
        }
      },
    ).catchError((onError) {
      isLoading.value = false;
      Get.snackbar(
        "otp info",
        'الايميل او كلمة المرور غير صحيح',
        snackPosition: SnackPosition.BOTTOM,
      );
    });
  }

  void logOut() {
    emailController.text = '';
    passwordController.text = '';

    auth.signOut();
    Get.offAll(LogInPage());
  }

  void passChange() {
    isPassword = !isPassword!;
  }
}
