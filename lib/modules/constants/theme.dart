import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var titleTheme = GoogleFonts.almarai().copyWith(
  color: Colors.teal.shade700,
  fontSize: 22,
  fontWeight: FontWeight.bold,
);
var subTitleTheme = GoogleFonts.notoKufiArabic().copyWith(
  color: const Color.fromRGBO(0, 0, 0, 1),
  fontSize: 17,
  height: 1.5,
);
var textFormStyle = const InputDecoration(
  border: OutlineInputBorder(
    borderSide: BorderSide(),
    borderRadius: BorderRadius.all(Radius.circular(12)),
  ),
);

var primaryColor = Colors.teal;
var backGroundColor = Colors.tealAccent;
var white = Colors.white;
