
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'helpers/bindings.dart';
import 'modules/homePage.dart';
import 'modules/itemsPage.dart';
import 'modules/onboarding.dart';
import 'modules/orderInfoPage.dart';

import 'modules/profile/profile_screen.dart';
import 'modules/servicesPage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final prefs = await SharedPreferences.getInstance();
  final showChoose = prefs.getBool('showChoose') ?? false;

  return runApp(
    MyApp(showChoose: showChoose),
  );
}

class MyApp extends StatelessWidget {
  final bool showChoose;
  const MyApp({
    Key? key,
    required this.showChoose,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      locale: const Locale('ar'),
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      home:  const OnBoarding(),
    );
  }
}
