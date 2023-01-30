import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../modules/constants/theme.dart';

class BuildPage extends StatelessWidget {
  final String urlImage;
  final String title;
  final String subtitle;

  const BuildPage(
      {Key? key,
      required this.urlImage,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          urlImage,
          width: 350,
          height: 300,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(title, textAlign: TextAlign.center, style: titleTheme),
        const SizedBox(
          height: 30,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child:
              Text(subtitle, textAlign: TextAlign.center, style: subTitleTheme),
        ),
      ],
    );
  }
}
