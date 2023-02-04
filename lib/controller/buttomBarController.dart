import 'package:another_stepper/dto/stepper_data.dart';
import 'package:charities/modules/constants/theme.dart';
import 'package:charities/modules/ordersPage.dart';
import 'package:charities/modules/searchpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../modules/homePage.dart';
import '../modules/profile/profile_screen.dart';

class BottomBarController extends GetxController {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);
  // BottomBarController(this.context);
  List<Widget> buildScreens() {
    return [
      const HomePage(),
      const MyOrdersPage(),
      const SearchPage(),
      ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        textStyle: subTitleTheme.copyWith(),
        icon: const Icon(CupertinoIcons.home),
        title: ("الرئيسية"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        textStyle: subTitleTheme,
        icon: const Icon(Icons.clean_hands_outlined),
        title: ("طلباتي"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        textStyle: subTitleTheme,
        icon: const Icon(Icons.local_grocery_store_outlined),
        title: ("البحث"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        textStyle: subTitleTheme,
        icon: const Icon(Icons.account_circle_outlined),
        title: ("حسابي"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

/////////////////////////////////////////////////////////////////
  var currentIndex = 0;

  void changeBottomNavBar(index) {
    currentIndex = index;
  }

  List<StepperData> stepperData = [
    StepperData(
        title: StepperText("تجهيز الطلب",
            textStyle: titleTheme.copyWith(fontSize: 16)),
        subtitle: StepperText("طلبك تحت المعالجة للانطلاق ",
            textStyle: subTitleTheme),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          child: const Icon(Icons.check_circle, color: Colors.white),
        )),
    StepperData(
        title:
            StepperText("انطلاق", textStyle: titleTheme.copyWith(fontSize: 16)),
        subtitle: StepperText(
          "تم تجهيز طلبك وتسليمه لخدمة التوصيل",
          textStyle: subTitleTheme,
        ),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          // child: const Icon(Icons.looks_two, color: Colors.white),
        )),
    StepperData(
      title: StepperText("تأكيد استلام الطلب",
          textStyle: titleTheme.copyWith(fontSize: 16)),
      // subtitle: StepperText("تأكيد استلام الطلب "),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(30)),),
        // child: const Icon(Icons.looks_3, color: Colors.white),
      ),
    ),
    // StepperData(
    //   title: StepperText("Delivered",
    //       textStyle: const TextStyle(
    //         color: Colors.grey,
    //       )),
    // ),
  ];

  // showBottomSheetFunction(BuildContext context) {}
}
