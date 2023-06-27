import 'package:flutter/material.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/colors.dart';

abstract class AppTheme {
  static ThemeData get defaultTheme {
    return ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        fontFamily: 'Euclad',
        primaryColor: AppColors.primary,
        textTheme: TextTheme(
            bodySmall: TextStyle(
                fontFamily: 'Euclad',
                color: AppColors.darkBlue.withOpacity(0.6),
                fontSize: 12),
            headlineLarge: const TextStyle(
                fontFamily: 'Euclad',
                color: AppColors.darkBlue,
                fontSize: 28)));
  }
}
