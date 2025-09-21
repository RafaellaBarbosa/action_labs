import 'package:action_labs/utils/colors.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static const String fontFamily = 'Roboto';

  static TextStyle dashboard({Color? color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: color ?? AppColors.branded,
  );

  static TextStyle headline1({Color? color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: color ?? AppColors.branded,
  );

  static TextStyle largeSemibold({Color? color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.55,
  );

  static TextStyle mediumSemibold({Color? color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: color ?? AppColors.branded,
  );

  static TextStyle buttonText({Color? color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.5,
    textBaseline: TextBaseline.alphabetic,
    color: color ?? AppColors.branded,
  );

  static TextStyle formText({Color? color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: color ?? AppColors.dark02,
  );

  static TextStyle smallSemibold({Color? color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: color ?? AppColors.branded,
  );

  static TextStyle smallRegular({Color? color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: color ?? AppColors.branded,
  );

  static TextStyle xsmallRegular({Color? color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.33,
    color: color ?? AppColors.branded,
  );

  static TextStyle table({Color? color}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: color ?? AppColors.branded,
  );
}
