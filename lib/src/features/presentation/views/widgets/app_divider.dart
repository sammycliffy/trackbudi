import 'package:flutter/material.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/colors.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.dividerColor,
      thickness: 1.0,
    );
  }
}
