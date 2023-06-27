import 'package:flutter/material.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/colors.dart';

arithmeticContainer(String symbol) {
  return Container(
    width: 20,
    height: 20,
    decoration: BoxDecoration(
        border: Border.all(color: AppColors.textGrey),
        shape: BoxShape.circle,
        color: AppColors.white),
    child: Center(
      child: Padding(
          padding: const EdgeInsets.only(bottom: 1), child: Text(symbol)),
    ),
  );
}
