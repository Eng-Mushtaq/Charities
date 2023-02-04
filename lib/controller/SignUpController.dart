import 'package:charities/modules/constants/theme.dart';
import 'package:charities/modules/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../modules/homePage.dart';
import '../models/user.dart';
import '../services/doctorService.dart';

class SignUpController extends GetxController {
  var auth = FirebaseAuth.instance;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var imageController = TextEditingController();
  RxBool isLoading = false.obs;
  bool? isPass = false;

  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection("Doctors");
  Users? userData;
  final box = GetStorage();

  @override
  void onInit() {
    if (box.read('userId') != null) {
      getUserdata(box.read('userId'));
    }
    super.onInit();
  }

  void SignUp({required String? email, required String? password}) async {
    try {
      isLoading.value = true;
      await auth
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
          .then(
        (value) {
          addUserToFirestore(value.user?.uid);
        },
      );
      Get.offAll(Home());
    } on FirebaseAuthException catch (error) {
      isLoading.value = true;
      String? title = error.code;
      String? message;
      if (error.code == 'week-password') {
        message = 'كلمة المرور ضعيفة ';
      } else if (error.code == 'email-already-in-use') {
        message = 'هذا الايميل مستخدم بالفعل ';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: backGroundColor,
        colorText: primaryColor,
      );
    } catch (error) {
      Get.snackbar('حدث خطأ', error.toString());
    }
  }

  void addUserToFirestore(String? userId) async {
    await FirestoreUsers()
        .addUserToFirestore(Users(
      userId: userId,
      email: emailController.text,
      name: nameController.text,
      password: passwordController.text,
      phoneNumber: phoneController.text,
      address: addressController.text,
      // createdAt: DateTime.now(),
    ))
        .then((value) {
      getUserdata(userId!);
      box.write('userId', userId);
      emailController.text = '';
      nameController.text = '';
      passwordController.text = '';
      phoneController.text = '';
      addressController.text = '';
      imageController.text = '';
    });
    //     .then((value) {
    //   getUserdata();
    // });
  }

  Future<Users?> getUserdata(String uId) async {
    try {
      DocumentSnapshot doc = await _userCollectionRef.doc(uId).get();
      userData = Users.fromJson(doc);
      isLoading.value = false;
      return userData;
    } catch (e) {
      printError(info: e.toString());
    }
    return null;
  }

  String? emailValidator(String value) {
    String? pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regex = RegExp(pattern);
    if (value.isEmpty) {
      return "لا يجب ان يكون الايميل فارغا";
    } else if (!regex.hasMatch(value) ||
        !value.contains(
          '@gmail.com',
        )) {
      return 'صيغة الايميل غير صحيحة';
    } else {
      return null;
    }
  }

  String? validateMobile(String? value) {
    // Indian Mobile number are of 10 digit only
    if (value!.isEmpty || value.length != 9) {
      return 'يجب ان يحتوي رقم الهاتف على 9 أرقام';
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    // Indian Mobile number are of 10 digit only
    if (value!.isEmpty || value.length < 6) {
      return ' يجب ان يكون طول كلمة المرور أكبر من 6 ';
    } else {
      return null;
    }
  }

  String? validate(String? val) {
    if (val!.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    return null;
  }

  void changePass() {
    isPass = !isPass!;
  }
}
