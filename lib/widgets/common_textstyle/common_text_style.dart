import 'package:ask/constants/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class CommonTextStyle {
  static TextStyle style1 = const TextStyle(
      color: Colors.white,
      letterSpacing: 0.4,
      fontSize: 13.0,
      fontWeight: FontWeight.w400);
  static TextStyle style2 = const TextStyle(
      color: AppColors.welcomeToTextColor,
      letterSpacing: 0.4,
      fontSize: 36.0,
      fontWeight: FontWeight.w400);

  static TextStyle style3 = const TextStyle(
      color: AppColors.buttonColor,
      letterSpacing: 0.4,
      fontSize: 36.0,
      fontWeight: FontWeight.w500);
  static TextStyle style4 = const TextStyle(
      color: Colors.black,
      letterSpacing: 0.4,
      fontSize: 13.0,
      fontWeight: FontWeight.w400);
  //--------------------Discover screen text------------

  static TextStyle style5font14weight500 = const TextStyle(
      color: Colors.black,
      letterSpacing: 0.4,
      fontSize: 14,
      fontWeight: FontWeight.w500);
  static TextStyle style6font10weight400 = const TextStyle(
      color: Color(0xffb8b8b8),
      letterSpacing: 0.4,
      fontSize: 10,
      fontWeight: FontWeight.w400);

  static TextStyle style6font10weight400black = const TextStyle(
      color: Colors.black,
      letterSpacing: 0.4,
      fontSize: 10,
      fontWeight: FontWeight.w400);
  static TextStyle style7font16weight700white = const TextStyle(
      color: Colors.white,
      letterSpacing: 0.4,
      fontSize: 16,
      fontWeight: FontWeight.w700);

  static TextStyle style1withBlueColor = const TextStyle(
      color: AppColors.buttonColor,
      letterSpacing: 0.4,
      fontSize: 13.0,
      fontWeight: FontWeight.w400);
  static TextStyle style1withHintTextColor = const TextStyle(
      color: AppColors.welcomeToTextColor,
      letterSpacing: 0.4,
      fontSize: 13.0,
      fontWeight: FontWeight.w400);

  static TextStyle styleTextColor = const TextStyle(
    color: AppColors.rememberPasswordColor,
    letterSpacing: 0.4,
    fontSize: 13.0,
    fontWeight: FontWeight.w500,
  );
  static TextStyle notifcationstyleTextColor = const TextStyle(
    color: AppColors.rememberPasswordColor,
    letterSpacing: 0.4,
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );
}
