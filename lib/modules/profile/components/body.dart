import 'package:flutter/material.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const ProfilePic(),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "حسابي",
            icon: "assets/icons/User_Icon.svg",
            press: () => {},
          ),
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
            press: () {},
          ),
        ],
      ),
    );
  }
}
