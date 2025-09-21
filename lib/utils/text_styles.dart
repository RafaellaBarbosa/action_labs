import 'package:action_labs/utils/colors.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static const String fontFamily = 'Roboto';

  static TextStyle headline1({Color? color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: color ?? AppColors.branded,
  );

  static TextStyle titleSemibold({Color? color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: color ?? AppColors.branded,
  );

  static TextStyle headline2(Color? color) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: color ?? AppColors.branded,
  );

  static TextStyle largeSemibold({Color? color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: color ?? AppColors.branded,
  );

  static TextStyle mediumSemibold({Color? color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: color ?? AppColors.branded,
  );

  static TextStyle buttonText(Color? color) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: color ?? AppColors.branded,
  );

  static TextStyle smallSemibold({Color? color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: color ?? AppColors.branded,
  );
  static TextStyle formText({Color? color}) => TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: color ?? AppColors.dark02,
  );
}
