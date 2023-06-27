import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/colors.dart';

bodyText({required String text, double? fontSize}) => Text(text,
    style: TextStyle(
        fontFamily: 'Euclad',
        color: AppColors.darkBlue.withOpacity(0.6),
        fontSize: fontSize?.dp ?? 12.dp));

customText(
        {required String text,
        required double fontSize,
        required Color textColor}) =>
    Text(text,
        style: TextStyle(
            fontFamily: 'Euclad', color: textColor, fontSize: fontSize.dp));

primaryText({required String text, double? fontSize}) => Text(text,
    style: TextStyle(
        fontFamily: 'Euclad',
        color: AppColors.darkBlue,
        fontSize: fontSize?.dp ?? 28.dp));
