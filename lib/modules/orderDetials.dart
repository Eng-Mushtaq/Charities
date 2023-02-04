import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:charities/modules/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/buttomBarController.dart';
import '../controller/dataController.dart';

class OrderDetialsScreen extends StatelessWidget {
  const OrderDetialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomBarController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('تفاصيل الطلب'),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Get.back(),
            ),
          ],
        ),
        elevation: 0.5,
        toolbarHeight: 100,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Color.fromARGB(255, 233, 255, 250),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/approved.png',
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'تم قبول طلبك',
                    style: titleTheme,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'حالة الطلب',
                    style: subTitleTheme.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('رقم الطلب -123455 '),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: AnotherStepper(
              stepperList: controller.stepperData,
              stepperDirection: Axis.vertical,
              activeBarColor: primaryColor,
              iconWidth: 40,
              iconHeight: 40,
              inActiveBarColor: Colors.grey,
              activeIndex: 2,
              barThickness: 8,
            ),
          ),
        ],
      ),
    );
  }
}
