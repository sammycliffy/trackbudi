import 'dart:developer';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/app_images.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/app_spacer.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/colors.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_country_widget.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_divider.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_dropdown.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_textformfield.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/custom_text.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/trackbudi_button.dart';

class Logistics extends HookWidget {
  const Logistics({super.key});

  @override
  Widget build(BuildContext context) {
    final isButtonDisabled = useState<bool>(false);
    final isLoading = useState<bool>(true);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    AppImages.logisticsHeading,
                    width: 80,
                    height: 80,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(
                            text: 'Company information',
                            fontSize: 14,
                            textColor: AppColors.textPrimary),
                        heightSpace(1),
                        bodyText(text: 'We want to know more about you')
                      ],
                    ),
                  )
                ],
              ),
              const AppDivider(),
              heightSpace(6),
              const TrackBudiTextFormField(
                label: 'Name of Company',
              ),
              heightSpace(2),
              customText(
                  text: 'Select country',
                  fontSize: 11,
                  textColor: AppColors.textPrimary),
              heightSpace(2),
              CountryWidget(selectCountry: (val) => log(val.toString())),
              heightSpace(2),
              const TrackBudiTextFormField(
                label: 'Address',
                // error: state.address.invalid ? state.address.error?.name : null,
                // onChanged: (p0) =>
                //     ref.read(authNotifier.notifier).addressChanged(p0),
              ),
              heightSpace(2),
              const TrackBudiTextFormField(
                label: 'Landmark',
              ),
              heightSpace(2),
              const TrackBudiTextFormField(
                label: 'Website',
                // onChanged: (p0) => ref.read(authNotifier.notifier).website(p0),
                hintText: 'Optional',
              ),
              heightSpace(3),
              customText(
                  text: 'Vehicle type',
                  fontSize: 11,
                  textColor: AppColors.textPrimary),
              heightSpace(2),
              Column(
                children: ["shop"]
                    .asMap()
                    .map((index, element) => MapEntry(
                          index,
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              color: Colors.red,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    const Icon(
                                      Icons.delete,
                                      color: AppColors.white,
                                    ),
                                    widthSpace(20),
                                    customText(
                                        text: 'Remove',
                                        fontSize: 11,
                                        textColor: AppColors.white),
                                  ],
                                ),
                              ),
                            ),

                            // ref
                            //     .read(authNotifier.notifier)
                            //     .removedata(
                            //         state.listOfvehicleType, element),
                            // key: UniqueKey(),
                            // child: vehicleComponent(
                            //   uncheck: () => isCurrent.value = index,
                            //   isSelected:
                            //       isCurrent.value == index ? true : false,
                            //   label: element.vehicle,
                            //   increaseValue: () => ref
                            //       .read(authNotifier.notifier)
                            //       .incrementVehicleFunc(element.vehicle),
                            //   quantity: element.quantity.toString(),
                            //   decreaseValue: element.quantity == 0
                            //       ? () {}
                            //       : () => ref
                            //           .read(authNotifier.notifier)
                            //           .decrementVehicleFunc(
                            //               element.vehicle),
                            // ),
                          ),
                        ))
                    .values
                    .toList(),
              ),
              heightSpace(3),
              customText(
                  text: 'What kind of goods can you move?',
                  fontSize: 11,
                  textColor: AppColors.textPrimary),
              heightSpace(3),
              DropdownSearch<String>.multiSelection(
                items: const [
                  'Documents, Files, Books or Stationary',
                  'Small appliances',
                  'Large Electronics, Luggages or Furniture',
                  'Frozen items, Perishables, or Prepared food delivery',
                  'Clothing, Accessories or Baby Products'
                ],

                popupProps: const PopupPropsMultiSelection.menu(
                  showSelectedItems: true,
                ),
                validator: (value) => (value!.isEmpty) ? 'Required' : null,
                // onChanged: (v) =>
                //     ref.read(authNotifier.notifier).kindOfGoodsFunc(v),
                // selectedItems: const [
                //   'Documents, Files, Books or Stationary'
                // ],
              ),
              heightSpace(3),
              TrackBudiDropdown(
                  dropdownList: const ["100", "200"],
                  label: 'Deliveries per month',
                  onChange: (val) => log(val.toString())),
              heightSpace(3),
              TrackBudiDropdown(
                  dropdownList: const ["Instagram", "facebook"],
                  label: 'How did you hear about us',
                  onChange: (val) => log(val.toString())),
              heightSpace(3),
              const TrackBudiTextFormField(
                label: 'Enter referral code (Optional)',
              ),
              heightSpace(3),
              TrackBudiButton(
                buttonText: 'I accept',
                // onTap: () => context.pushRoute(SettingUp()),

                disable: isButtonDisabled.value,
                isLoading: isLoading.value,
                // onTap:
              ),
              heightSpace(3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  bodyText(text: 'Already have an account?'),
                  widthSpace(2),
                  GestureDetector(
                    // onTap: () => context.pushRoute(LoginView()),
                    child: customText(
                        text: 'Login',
                        fontSize: 14,
                        textColor: AppColors.textPrimary),
                  )
                ],
              ),
              heightSpace(5)
            ],
          ),
        ),
      ),
    );
  }
}
