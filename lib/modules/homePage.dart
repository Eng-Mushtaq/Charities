import 'package:charities/controller/dataController.dart';
import 'package:charities/models/charityModel.dart';
import 'package:charities/modules/ordersPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants/theme.dart';
import '../widgets/charityItem.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // const Test({.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final DataController dataController = Get.find();
    List<Charity> charty = [];
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
                            onPressed: () {
                              Get.to(() => const MyOrdersPage());
                            },
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
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('chrities')
                    .snapshots(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return const Center(child: CircularProgressIndicator());
                    case ConnectionState.active:
                    case ConnectionState.done:
                      final data = snapshot.data!.docs;
                      print('MMMMMMMMMMMMM');
                      print(data);
                      print('MMMMMMMMMMMMM');
                      charty =
                          data.map((e) => Charity.fromJson(e.data())).toList();

                      if (charty.isNotEmpty) {
                        return SizedBox(
                          height: size.height * 0.6,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: 0.77),
                            itemCount: charty.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CharityItem(
                                size: size,
                                charity: charty[index],
                              );
                            },
                          ),
                        );
                      } else {
                        return const Center(
                          child: Text('no data foud'),
                        );
                      }
                  }
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => dataController.addData(charitiesList),
        child: const Icon(Icons.add),
      ),
    );
  }
}
