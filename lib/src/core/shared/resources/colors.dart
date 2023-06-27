import 'package:flutter/material.dart';

class AppColors {
  static const Color white = Color(0xffFFFFFF);
  static const Color primary = Color(0xff6667FA);
  static const Color black = Color(0xff000000);
  static const Color red = Color(0xffE53935);
  static const Color green = Color(0xff31BC7B);
  static const Color yellow = Color(0xffFECC32);
  static const Color textGrey = Color(0xff75788D);
  static const Color darkBlue = Color(0xff140033);
  static const Color lightPrimary = Color(0xff6768FB);
  static const Color textPrimary = Color(0xff0d062d);
  static const Color textformGrey = Color(0xffdddce1);
  static const Color dividerColor = Color(0xffe7e7e7);

  static OutlineInputBorder errorBorder = const OutlineInputBorder(
      borderSide: BorderSide(
        color: red,
      ),
      borderRadius: BorderRadius.all(Radius.circular(5)));
  static OutlineInputBorder normalBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.textformGrey),
      borderRadius: BorderRadius.all(Radius.circular(5)));

  static OutlineInputBorder emptyBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.textformGrey),
      borderRadius: BorderRadius.all(Radius.circular(5)));
}
