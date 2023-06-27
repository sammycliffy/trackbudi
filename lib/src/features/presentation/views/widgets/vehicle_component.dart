import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/colors.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/custom_text.dart';

import '../../../../core/shared/resources/app_spacer.dart';

class VehicleComponent extends StatefulWidget {
  final String vehicleType;
  final int quantity;
  final bool isChecked;
  const VehicleComponent(
      {super.key,
      required this.isChecked,
      required this.quantity,
      required this.vehicleType});

  @override
  State<VehicleComponent> createState() => _VehicleComponentState();
}

class _VehicleComponentState extends State<VehicleComponent> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      width: double.infinity,
      height: 7.5.h,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.textformGrey),
          borderRadius: BorderRadius.circular(8)),
      child: Row(children: [
        Container(
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: AppColors.primary),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 1),
              child: Icon(
                Icons.check,
                color: AppColors.white,
                size: 13,
              ),
            ),
          ),
        ),
        widthSpace(3),
        Expanded(
          child: customText(
              text: widget.vehicleType,
              fontSize: 14,
              textColor: AppColors.textPrimary),
        ),
        SizedBox(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              arithmeticContainer('-'),
              customText(
                  text: widget.quantity.toString(),
                  fontSize: 14,
                  textColor: AppColors.textPrimary),
              arithmeticContainer('+'),
            ],
          ),
        )
      ]),
    );
  }
}
