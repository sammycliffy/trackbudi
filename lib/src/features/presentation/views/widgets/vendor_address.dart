import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:trackbudi_vendor/src/config/keys/app_keys.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/app_spacer.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/colors.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/custom_text.dart';

class GoogleVendorAddressField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChange;
  final String? Function(String?)? validator;
  final void Function()? remove;

  const GoogleVendorAddressField(
      {super.key,
      required this.controller,
      this.onChange,
      this.validator,
      this.remove});

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
            googleAPIKey: AppKeys.googleAPI,
            inputDecoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: remove,
                    child: Container(
                        padding: const EdgeInsets.only(bottom: 2),
                        width: 70,
                        decoration: const BoxDecoration(
                            border: Border(
                                left:
                                    BorderSide(color: AppColors.textformGrey))),
                        child: Center(
                          child: customText(
                              text: 'Remove',
                              fontSize: 12,
                              textColor: AppColors.red),
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
              onChange!(prediction.description!);
              controller.selection = TextSelection.fromPosition(
                  TextPosition(offset: prediction.description!.length));
            }),
      ],
    );
  }
}
