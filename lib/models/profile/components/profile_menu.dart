import 'package:charities/modules/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileMenu extends StatelessWidget {
  ProfileMenu({
    required this.text,
    required this.icon,
    required this.press,
  }) : super();

  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          // primary: kPrimaryColor,
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(icon),
            SizedBox(width: 20),
            Expanded(
                child: Text(
              text,
              style: subTitleTheme,
            )),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
