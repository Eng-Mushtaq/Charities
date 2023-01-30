import 'package:charities/models/charityModel.dart';
import 'package:flutter/material.dart';

import 'constants/theme.dart';
import '../widgets/charityItem.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // const Test({.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.teal,
              height: size.height * 0.16,
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
                          'الرئيسية',
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
                    Container(
                      // color: Colors.white,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        color: Color.fromRGBO(236, 236, 236, 2),
                      ),

                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'البحث عن جمعية',
                          hintStyle: subTitleTheme.copyWith(color: Colors.grey),
                          contentPadding: const EdgeInsets.all(10),
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {},
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
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
                'الجمعيات الخيرية',
                style: titleTheme,
              ),
            ),
            SizedBox(
              height: size.height * 0.6,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.77),
                itemCount: charitiesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return CharityItem(
                    size: size,
                    charity: charitiesList[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}