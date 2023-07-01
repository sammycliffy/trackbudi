import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/app_spacer.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/colors.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/custom_text.dart';

class GoogleAddressField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const GoogleAddressField(
      {super.key, required this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText(
            text: 'Address', fontSize: 14, textColor: AppColors.textPrimary),
        heightSpace(2),
        GooglePlaceAutoCompleteTextField(
            validator: validator,
            textEditingController: controller,
            googleAPIKey: "AIzaSyCot7JFmeoZdJ57uo-ynrNW6BEryat12MM",
            inputDecoration: InputDecoration(
                disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.textformGrey),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.textformGrey),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                contentPadding: const EdgeInsets.only(left: 10),
                errorStyle: const TextStyle(fontSize: 14),
                suffixIcon: Container(
                  margin: const EdgeInsets.all(10),
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.textformGrey),
                      shape: BoxShape.circle),
                  child: const Icon(Icons.location_on_outlined),
                ),
                hintStyle: const TextStyle(fontSize: 14),
                fillColor: AppColors.white,
                filled: true,
                enabledBorder: AppColors.normalBorder,
                errorBorder: AppColors.errorBorder,
                focusedBorder: AppColors.normalBorder,
                focusedErrorBorder: AppColors.normalBorder),
            debounceTime: 800, // default 600 ms,
            countries: const [
              "ng",
            ], // optional by default null is set
            isLatLngRequired:
                true, // if you required coordinates from place detail
            getPlaceDetailWithLatLng: (Prediction prediction) {
              // this method will return latlng with place detail
              print("placeDetails${prediction.lng}");
            }, // this callback is called when isLatLngRequired is true
            itmClick: (Prediction prediction) {
              controller.text = prediction.description!;
              controller.selection = TextSelection.fromPosition(
                  TextPosition(offset: prediction.description!.length));
            }),
      ],
    );
  }
}
