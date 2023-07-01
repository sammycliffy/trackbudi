import 'package:flutter/material.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/app_spacer.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_textformfield.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/vendor_address.dart';

class CustomVendorPickAddressWidget extends StatelessWidget {
  final TextEditingController controller;
  final void Function()? remove;
  final void Function(String)? addressChange;
  final void Function(String)? landmark;
  const CustomVendorPickAddressWidget({
    super.key,
    this.landmark,
    this.remove,
    this.addressChange,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 15),
      child: Column(
        children: [
          GoogleVendorAddressField(
            controller: controller,
            onChange: addressChange,
          ),
          heightSpace(2),
          TrackBudiTextFormField(label: 'Landmark', onChanged: landmark),
        ],
      ),
    );
  }
}
