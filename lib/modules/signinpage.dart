import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/loginController.dart';
import '../widgets/textFormField.dart';
import 'constants/theme.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<StatefulWidget> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool pass = true;

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: Container(
        //color: Colors.red,
        width: double.infinity,
        height: 400,
        padding: const EdgeInsets.only(top: 150, left: 10),
        child: Text('تسجيل الدخول', style: titleTheme),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.only(top: 30, right: 35, left: 35),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color: Color.fromRGBO(236, 236, 236, 2),
        ),
        width: double.infinity,
        height: 550,
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),

            //email
            // Text("عنوان البريد الالكتروني",
            //     textAlign: TextAlign.start, style: subTitleTheme),
            const SizedBox(
              height: 5,
            ),
            textFormField(
              controller: loginController.emailController,
              lableText: 'البريد الالكتروني',
              textType: TextInputType.emailAddress,
            ),

            const SizedBox(
              height: 20,
            ),

            // //password
            // Text("كلمة المرور",
            //     textAlign: TextAlign.start, style: subTitleTheme),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: loginController.passwordController,
              decoration: InputDecoration(
                label: const Text('كلمة المرور'),
                labelStyle: subTitleTheme,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                suffixIcon: IconButton(
                    icon: Icon(loginController.isPassword!
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      loginController.passChange();
                    }),
              ),
              obscureText: loginController.isPassword!,
              keyboardType: TextInputType.visiblePassword,
            ),

            const SizedBox(
              height: 50,
            ),
            Obx(() => OutlinedButton(
                  onPressed: () {
                    loginController.signIn(
                      loginController.emailController.text,
                      loginController.passwordController.text,
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.teal.shade700,
                    primary: Colors.white,
                    fixedSize: const Size(320, 60),
                    textStyle: titleTheme.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  child: loginController.isLoading.value
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text('تسجيل الدخول'),
                )),

            const SizedBox(
              height: 20,
            ),

            //forgetpass
            TextButton(
                onPressed: () {},
                child: Text('هل نسيت كلمة المرور ؟', style: subTitleTheme))
          ],
        ),
      ),
    );
  }
}
