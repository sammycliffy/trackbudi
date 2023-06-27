import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/colors.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/arithmetic_txt_wid.dart';

import '../../../../core/shared/resources/app_spacer.dart';
import 'custom_text.dart';

vehicleComponent(
        {final bool? isSelected = false,
        final Function()? increaseValue,
        Function()? decreaseValue,
        Function()? uncheck,
        String? label,
        quantity}) =>
    GestureDetector(
      onTap: uncheck,
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 10),
        width: double.infinity,
        height: 6.h,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.textformGrey),
            borderRadius: BorderRadius.circular(8)),
        child: Row(children: [
          isSelected == true
              ? Container(
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
                )
              : Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.textformGrey)),
                ),
          widthSpace(3),
          Expanded(
            child: customText(
                text: label ?? '',
                fontSize: 14,
                textColor: AppColors.textPrimary),
          ),
          SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: arithmeticContainer('-'),
                  onTap: decreaseValue,
                ),
                widthSpace(1),
                customText(
                    text: quantity ?? '',
                    fontSize: 14,
                    textColor: AppColors.textPrimary),
                widthSpace(1),
                GestureDetector(
                  onTap: increaseValue,
                  child: arithmeticContainer('+'),
                )
              ],
            ),
          )
        ]),
      ),
    );
