import 'package:charities/widgets/serviceItem.dart';
import 'package:charities/widgets/textFormField.dart';
import 'package:flutter/material.dart';

import '../widgets/Item.dart';
import 'constants/theme.dart';
import '../widgets/charityItem.dart';

class OrderInfoPage extends StatelessWidget {
  const OrderInfoPage({super.key});

  // const Test({.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('ادخل معلومات الطلب'),
        backgroundColor: primaryColor,
        centerTitle: true,
        elevation: 0.5,
        toolbarHeight: size.height * 0.08,
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        // physics:
        // const ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),

        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: size.width,
            // minHeight: size.height,
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom / 25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // color: Colors.white,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 221, 221, 221),
                            offset: Offset(1, 1)),
                      ],
                    ),
                    height: size.height * 0.07,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text('استخدم موقعك الحالي'),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.my_location_outlined),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Form(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          textFormField(
                            lableText: 'الاسم',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          textFormField(
                            lableText: 'الهاتف',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          textFormField(
                            lableText: 'عنوان الشارع',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          textFormField(
                            lableText: 'المدينة',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          textFormField(
                            lableText: 'الحي',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          textFormField(
                            lableText: 'zipCode',
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: size.height * 0.1,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: ElevatedButton(
            onPressed: (() {}),
            child: const Text(
              'حفظ',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
