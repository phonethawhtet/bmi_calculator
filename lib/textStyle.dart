import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle customTextStyle({
  double fontSize = 14.0,
  Color color = Colors.black87,
  bool bold = false,
}) =>
    GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      ),
    );
