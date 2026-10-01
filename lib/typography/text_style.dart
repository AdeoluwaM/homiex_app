import 'package:flutter/material.dart';
import 'package:homix/gen/fonts.gen.dart';

class AppTextStyle {
  static TextStyle get appTextHeading => TextStyle(
    fontFamily: FontFamily.poppins,
    fontWeight: FontWeight.w400,
    fontSize: 35,
  );
  static TextStyle get appSubHeading => TextStyle(
    fontFamily: FontFamily.poppins,
    fontWeight: FontWeight.w400,
    fontSize: 20,
  );
  static TextStyle get appTitle => TextStyle(
    fontFamily: FontFamily.poppins,
    fontWeight: FontWeight.w400,
    fontSize: 10,
  );
  static TextStyle get appSubTitle => TextStyle(
    fontFamily: FontFamily.poppins,
    fontWeight: FontWeight.w400,
    fontSize: 08,
  );
}