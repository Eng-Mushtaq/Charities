import 'package:charities/controller/SignUpController.dart';
import 'package:charities/modules/homePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/textFormField.dart';
import 'constants/theme.dart';

class SignUp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

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
        child: Form(
          key: _formKey,
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
                validate: (value) => signUp.validate(value),
              ),
              const SizedBox(
                height: 20,
              ),

              //email

              textFormField(
                controller: signUp.emailController,
                lableText: 'البريد الالكتروني',
                textType: TextInputType.emailAddress,
                validate: (value) => signUp.emailValidator(value),
              ),

              const SizedBox(
                height: 20,
              ),

              //phone

              textFormField(
                controller: signUp.phoneController,
                lableText: 'رقم الهاتف',
                validate: (value) => signUp.validateMobile(value),
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
                    icon: Icon(signUp.isPass!
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed:() => 
                      signUp.changePass()
                    ,
                  ),
                ),
                validator: ((value) => signUp.validatePassword(value)),
                obscureText: signUp.isPass!,
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 20,
              ),
              textFormField(
                controller: signUp.addressController,
                lableText: 'العنوان',
                textType: TextInputType.streetAddress,
                validate: (val) => signUp.validate(val),
              ),

              const SizedBox(
                height: 50,
              ),

              Obx(() => OutlinedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        signUp.SignUp(
                          email: signUp.emailController.text,
                          password: signUp.passwordController.text,
                        );
                      }
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
      ),
    );
  }
}
