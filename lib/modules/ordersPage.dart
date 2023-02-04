import 'package:charities/controller/dataController.dart';
import 'package:charities/models/charityModel.dart';
import 'package:charities/widgets/serviceItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/Item.dart';
import 'constants/theme.dart';
import '../widgets/charityItem.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({
    super.key,
  });
  // const Test({.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DataController controller = Get.find();
    return Obx(() => Scaffold(
          backgroundColor: Colors.grey[100],
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width,
                  color: Colors.teal,
                  height: size.height * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          'طلباتي ',
                          style: titleTheme.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                controller.orders.value.isEmpty
                    ? Center(
                        child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15.0,
                        ),
                        child: Text(
                          'لا يوجد لديك طلبات',
                          style: subTitleTheme,
                        ),
                      ))
                    : SizedBox(
                        height: size.height * 0.79,
                        child: ListView.separated(
                          itemCount: controller.orders.value.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Item(
                              prouct: controller.orders.value[index],
                              title: 'تاريخ الطلب 4/2/2022',
                              onTap: () {},
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ));
  }
}
