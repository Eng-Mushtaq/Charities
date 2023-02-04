import 'package:flutter/material.dart';

import 'components/body.dart';

class ProfilePage extends StatelessWidget {
  // static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("حسابي"),
      ),
      body: Body(),
      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
