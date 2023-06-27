import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/colors.dart';

class TrackBudiPhoneField extends StatelessWidget {
  final FutureOr<String?> Function(PhoneNumber?)? validator;
  final Function(PhoneNumber)? onChanged;
  final bool enabled;
  const TrackBudiPhoneField({
    super.key,
    this.validator,
    this.enabled = true,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      cursorColor: AppColors.lightPrimary,
      cursorWidth: 0.9,
      disableLengthCheck: false,
      style: const TextStyle(
          fontFamily: 'Euclad', fontSize: 14, fontWeight: FontWeight.w400),
      validator: validator,
      dropdownTextStyle: const TextStyle(fontFamily: 'Euclad'),
      pickerDialogStyle: PickerDialogStyle(
          countryNameStyle: const TextStyle(
            fontFamily: 'Euclad',
          ),
          countryCodeStyle: const TextStyle(
            fontFamily: 'Euclad',
          )),
      decoration: const InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textformGrey),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.red),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textformGrey),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.red),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        counter: SizedBox.shrink(),
        border: OutlineInputBorder(),
      ),
      initialCountryCode: 'NG',
      onChanged: onChanged,
    );
  }
}
