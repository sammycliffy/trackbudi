import 'package:flutter/material.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/colors.dart';

arithmeticContainer(String symbol) {
  return Container(
    width: 30,
    height: 30,
    padding: const EdgeInsets.only(bottom: 2),
    decoration: BoxDecoration(
        border: Border.all(color: AppColors.textGrey),
        shape: BoxShape.circle,
        color: AppColors.white),
    child: Center(
      child: Text(
        symbol,
        style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
      ),
    ),
  );
}
