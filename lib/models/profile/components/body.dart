import 'package:charities/controller/loginController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/user.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginController log = Get.find();
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: StreamBuilder<Object>(
          stream: FirebaseFirestore.instance
              .collection('Users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text("لا يوجد اتصال بالانترنت ");

              case ConnectionState.active:
              case ConnectionState.waiting:

              // return const Center(child: CircularProgressIndicator());

              case ConnectionState.done:
                if (snapshot.hasData) {
                  Users user = Users.fromJson(snapshot.data);
                  return Column(
                    children: [
                      const ProfilePic(),
                      const SizedBox(height: 20),
                      Text('اسم المستخدم : ${user.name!}'),
                      SizedBox(
                        height: 10,
                      ),
                      Text(' الايميل : ${user.email!}'),
                      SizedBox(
                        height: 10,
                      ),
                      Text(' رقم الهاتف : ${user.phoneNumber!}'),
                      // ProfileMenu(
                      //   text: "حسابي",
                      //   icon: "assets/icons/User_Icon.svg",
                      //   press: () => {},
                      // ),
                      ProfileMenu(
                        text: "الاشعارت",
                        icon: "assets/icons/Bell.svg",
                        press: () {},
                      ),
                      ProfileMenu(
                        text: "الاعدادت",
                        icon: "assets/icons/Settings.svg",
                        press: () {},
                      ),
                      ProfileMenu(
                        text: "مركز الدعم",
                        icon: "assets/icons/Question_mark.svg",
                        press: () {},
                      ),
                      ProfileMenu(
                        text: "تسجيل خروج",
                        icon: "assets/icons/Log_out.svg",
                        press: () =>log.logOut(),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: Text('لا يوجد بيانات متاحة حاليا'),
                  );
                }
            }
          }),
    );
  }
}
