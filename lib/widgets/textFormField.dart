import 'package:flutter/material.dart';

import '../controller/SignUpController.dart';
import '../modules/constants/theme.dart';

class textFormField extends StatelessWidget {
  textFormField({
    Key? key,
    this.controller,
    this.textType,
    this.lableText,
    this.validate
  }) : super(key: key);

  TextEditingController? controller = TextEditingController();
  String? lableText;
  TextInputType? textType;
  var validate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: lableText,
        labelStyle: subTitleTheme,
        // hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: validate,
    );
  }
}
