import 'package:charities/models/charityModel.dart';
import 'package:charities/modules/itemsPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/constants/theme.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({Key? key, required this.size, this.service})
      : super(key: key);

  final Size size;
  final Service? service;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: (() => Get.to(() => ItemsPage(
              itemsList: service!.productsList!,
              title: service!.name,
            ))),
        child: Container(
          margin: const EdgeInsets.all(5),
          width: size.width * 0.25,
          // color: Colors.greenAccent,
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              border: Border.all(color: backGroundColor, width: 0.7)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                // 'assets/images/alber.png',
                service!.logoUrl!,
                height: size.height * 0.1,
              ),
              Text(
                service!.name!,
                style: subTitleTheme.copyWith(fontSize: 16),
              )
              // const Text('ملابس')
            ],
          ),
        ),
      ),
    );
  }
}
