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
      const OrdersPage(),
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

  // showBottomSheetFunction(BuildContext context) {}
}
