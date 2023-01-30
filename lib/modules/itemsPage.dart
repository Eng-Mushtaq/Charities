import 'package:charities/models/charityModel.dart';
import 'package:charities/widgets/serviceItem.dart';
import 'package:flutter/material.dart';

import '../widgets/Item.dart';
import 'constants/theme.dart';
import '../widgets/charityItem.dart';

class ItemsPage extends StatelessWidget {
  ItemsPage({super.key, this.itemsList});
  List<Products>? itemsList;
  // const Test({.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.teal,
              height: size.height * 0.1,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ملابس',
                          style: titleTheme.copyWith(color: Colors.white),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 20.0,
              ),
              child: Text(
                'خدمات الجمعية',
                style: titleTheme,
              ),
            ),
            SizedBox(
              height: size.height * 0.79,
              child: ListView.separated(
                itemCount: itemsList!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Item(prouct: itemsList![index]);
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
