import 'package:flutter/material.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/app_spacer.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/colors.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_textformfield.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/custom_text.dart';

class CustomVendorPickAddressWidget extends StatelessWidget {
  final void Function(String)? address;
  final void Function()? remove;

  final void Function(String)? landmark;
  const CustomVendorPickAddressWidget({
    super.key,
    this.address,
    this.landmark,
    this.remove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 15),
      child: Column(
        children: [
          TextField(
            onChanged: address,
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: remove,
                    child: Container(
                        padding: const EdgeInsets.only(bottom: 2),
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.white)),
                        child: Center(
                          child: customText(
                              text: '-',
                              fontSize: 20,
                              textColor: AppColors.black),
                        )),
                  ),
                ),
                errorStyle: const TextStyle(fontSize: 10),
                hintText: 'e.g no 8 example street',
                hintStyle: const TextStyle(fontSize: 14),
                prefixIcon: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.textformGrey)),
                    child: const Icon(
                      Icons.location_on_outlined,
                      color: AppColors.black,
                      size: 20,
                    ),
                  ),
                ),
                fillColor: AppColors.white,
                filled: true,
                enabledBorder: AppColors.normalBorder,
                errorBorder: AppColors.errorBorder,
                focusedBorder: AppColors.normalBorder,
                focusedErrorBorder: AppColors.normalBorder),
          ),
          heightSpace(2),
          TrackBudiTextFormField(label: 'Landmark', onChanged: landmark),
        ],
      ),
    );
  }
}
