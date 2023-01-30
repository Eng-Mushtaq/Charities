import 'package:charities/controller/SignUpController.dart';
import 'package:charities/modules/homePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/textFormField.dart';
import 'constants/theme.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool pass = true;
  @override
  Widget build(BuildContext context) {
    final SignUpController signUp = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.blue,
              size: 30,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: Container(
        color: Colors.deepPurple,
        padding: const EdgeInsets.only(top: 20, left: 10),
        child: const Text(
          'hk',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.only(top: 30, right: 35, left: 35),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color: Color.fromRGBO(236, 236, 236, 2),
        ),
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('انشاء حساب جديد',
                textAlign: TextAlign.center, style: titleTheme),

            const SizedBox(
              height: 30,
            ),

            //name

            textFormField(
              controller: signUp.nameController,
              lableText: 'الاسم الرباعي',
              textType: TextInputType.name,
            ),
            const SizedBox(
              height: 20,
            ),

            //email

            textFormField(
              controller: signUp.emailController,
              lableText: 'البريد الالكتروني',
              textType: TextInputType.emailAddress,
            ),

            const SizedBox(
              height: 20,
            ),

            //phone

            textFormField(
              controller: signUp.phoneController,
              lableText: 'رقم الهاتف',
            ),

            const SizedBox(
              height: 20,
            ),

            //password

            TextFormField(
              controller: signUp.passwordController,
              decoration: InputDecoration(
                label: const Text(
                  'كلمة المرور',
                ),
                labelStyle: subTitleTheme,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                suffixIcon: IconButton(
                  icon: Icon(pass ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      pass = !pass;
                    });
                  },
                ),
              ),
              obscureText: pass,
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(
              height: 20,
            ),
            textFormField(
              controller: signUp.addressController,
              lableText: 'العنوان',
              textType: TextInputType.streetAddress,
            ),

            const SizedBox(
              height: 50,
            ),

            Obx(() => OutlinedButton(
                  onPressed: () {
                    signUp.SignUp(
                      email: signUp.emailController.text,
                      password: signUp.passwordController.text,
                    );
                    // Get.to(Home());
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.teal.shade700,
                    primary: Colors.white,
                    fixedSize: const Size(320, 60),
                    textStyle: titleTheme.copyWith(fontSize: 18),
                  ),
                  child: signUp.isLoading.value
                      ? const CircularProgressIndicator()
                      : const Text("انشاء الحساب"),
                )),
          ],
        ),
      ),
    );
  }
}
