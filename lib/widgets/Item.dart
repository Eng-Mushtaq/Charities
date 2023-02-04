import 'package:charities/models/charityModel.dart';
import 'package:charities/modules/constants/theme.dart';
import 'package:charities/modules/orderInfoPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Item extends StatelessWidget {
  Item({super.key, this.prouct, this.title,this.onTap});
  final Products? prouct;
  String? title;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: size.height * 0.1,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: GestureDetector(
            onTap:onTap==null?(() => Get.to(() => OrderInfoPage(
                  product: prouct,
                ))):null,
            child: ListTile(
              title: Text(prouct!.name!),
              // title: const Text('ثوب شبابي'),
              subtitle: Text(
                // 'Xl-L-M',
                prouct!.description!,
                style: TextStyle(color: primaryColor),
              ),
              trailing:title==null? ElevatedButton(
                  onPressed: (() => Get.to(() => OrderInfoPage(
                        product: prouct,
                      ))),
                  child: const Text('اطلب الان')): Text(title!),
              leading: Image.asset(
                // 'assets/images/alber.png',
                prouct!.imageUrl!,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
