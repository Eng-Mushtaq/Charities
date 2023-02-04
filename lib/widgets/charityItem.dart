import 'package:charities/models/charityModel.dart';
import 'package:charities/modules/servicesPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/constants/theme.dart';

class CharityItem extends StatelessWidget {
  const CharityItem({
    Key? key,
    this.charity,
    required this.size,
  }) : super(key: key);

  final Size size;
  final Charity? charity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),

      width: size.width * 0.3,
      // color: Colors.greenAccent,
      decoration: const BoxDecoration(
        color: Color.fromARGB(251, 232, 232, 232),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            // 'assets/images/alber.png',
            charity!.logoUrl!,
            height: size.height * 0.1,
          ),
        ),
        Container(
          height: size.height * 0.18,
          width: size.width * 0.5,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    // 'جمعية البر الخيرية',
                    charity!.name!,
                    style: subTitleTheme,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      const Icon(Icons.location_on),
                      Text(charity!.address!),
                      // Text('شمال الرياض'),
                    ],
                  ),
                  OutlinedButton(
                      onPressed: () => Get.to(() =>  ServicesPage(service: charity!.servicesTypes,)),
                      child: const Text(
                        'تصفح',
                      ))
                ]),
          ),
        )
      ]),
    );
  }
}
