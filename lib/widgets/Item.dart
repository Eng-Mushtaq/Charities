import 'package:charities/models/charityModel.dart';
import 'package:charities/modules/constants/theme.dart';
import 'package:charities/modules/orderInfoPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Item extends StatelessWidget {
  const Item({super.key,this.prouct});
  final Products? prouct;
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
            onTap: (() => Get.to(() => const OrderInfoPage())),
            child: ListTile(
              title: Text(prouct!.name!),
              // title: const Text('ثوب شبابي'),
              subtitle: Text(
                // 'Xl-L-M',
                prouct!.description!,
                style: TextStyle(color: primaryColor),
              ),
              trailing: ElevatedButton(
                  onPressed: () {}, child: const Text('اطلب الان')),
              leading: Image.asset(
                'assets/images/alber.png',
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
