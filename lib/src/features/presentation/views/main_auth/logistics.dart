import 'dart:developer';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trackbudi_vendor/src/config/keys/routes.dart';
import 'package:trackbudi_vendor/src/core/mixin/validators.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/app_images.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/app_spacer.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/colors.dart';
import 'package:trackbudi_vendor/src/features/data/models/logistics_model.dart';
import 'package:trackbudi_vendor/src/features/domain/repository/auth_repository.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_app_bar.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_country_widget.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_divider.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_dropdown.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_textformfield.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/custom_text.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/trackbudi_button.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/vehicle_widget.dart';

class Logistics extends StatefulWidget {
  const Logistics({super.key});

  @override
  State<Logistics> createState() => _LogisticsState();
}

class _LogisticsState extends State<Logistics> {
  final AuthRepo _authRepo = AuthRepo();
  final _nameOfCompany = TextEditingController();
  final _address = TextEditingController();
  final _country = TextEditingController();
  final _landMark = TextEditingController();
  final _website = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final _goodType = TextEditingController();
  final _deliveriesPerMonth = TextEditingController();
  final _aboutUs = TextEditingController();
  final referralCode = TextEditingController();
  final _latitude = TextEditingController();
  final _longitude = TextEditingController();
  List<VehicleTypes> newVehicleType = [];
  List<String> whatDoyouMove = [];
  bool isValidated = false;
  bool isButtonDisabled = true;

  List<Map> vehicleTypes = [
    {"vehicleType": "Motor bike", "quantity": 0, "isSelected": false},
    {"vehicleType": "Mini van", "quantity": 0, "isSelected": false},
    {"vehicleType": "Truck", "quantity": 0, "isSelected": false}
  ];

  List<String> deliveriesPerMonth = [
    "Select",
    "0 - 100",
    "100 - 1000",
    "1000 - 10000",
    "10000",
    "Just getting Started"
  ];

  List<String> aboutUs = [
    "Select",
    "Word of mouth",
    "Instagram",
    "Twitter",
    "Google Search"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: () {
              setState(() {
                isButtonDisabled = _formkey.currentState!.validate();
              });
            },
            key: _formkey,
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
                TrackBudiTextFormField(
                  label: 'Name of Company',
                  validator: stringValidation,
                  textEditingController: _nameOfCompany,
                ),
                heightSpace(2),
                customText(
                    text: 'Select country',
                    fontSize: 14,
                    textColor: AppColors.textPrimary),
                heightSpace(2),
                CountryWidget(selectCountry: (val) {
                  _country.text = val!;
                }),
                heightSpace(2),
                TrackBudiTextFormField(
                  isAddress: true,
                  label: 'Address',
                  textEditingController: _address,
                  validator: stringValidation,
                ),
                heightSpace(2),
                TrackBudiTextFormField(
                  label: 'Landmark',
                  validator: stringValidation,
                  textEditingController: _landMark,
                ),
                heightSpace(2),
                TrackBudiTextFormField(
                  label: 'Website',
                  hintText: 'Optional',
                  textEditingController: _website,
                ),
                heightSpace(3),
                customText(
                    text: 'Vehicle type',
                    fontSize: 14,
                    textColor: AppColors.textPrimary),
                heightSpace(2),
                Column(
                  children: vehicleTypes
                      .asMap()
                      .map((index, element) => MapEntry(
                            index,
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: vehicleComponent(
                                    isSelected: vehicleTypes[index]
                                        ['isSelected'],
                                    uncheck: () {
                                      setState(() {
                                        vehicleTypes[index]['isSelected'] =
                                            !vehicleTypes[index]['isSelected'];
                                      });
                                    },
                                    increaseValue: () {
                                      setState(() {
                                        vehicleTypes[index]['quantity']++;
                                      });

                                      if (newVehicleType.any((element) =>
                                          element.vehicle ==
                                          vehicleTypes[index]['vehicleType'])) {
                                        newVehicleType[index].quantity =
                                            newVehicleType[index].quantity! + 1;
                                        return;
                                      }
                                      newVehicleType.add(VehicleTypes(
                                          vehicle: vehicleTypes[index]
                                              ['vehicleType'],
                                          quantity: 1));

                                      log(newVehicleType.toString());
                                    },
                                    decreaseValue: () {
                                      if (vehicleTypes[index]['quantity'] > 0) {
                                        setState(() {
                                          vehicleTypes[index]['quantity']--;
                                        });

                                        if (newVehicleType.any((element) =>
                                            element.vehicle ==
                                            vehicleTypes[index]
                                                ['vehicleType'])) {
                                          newVehicleType[index].quantity =
                                              newVehicleType[index].quantity! -
                                                  1;
                                          return;
                                        }

                                        log(vehicleTypes.toString());
                                      }
                                    },
                                    label: vehicleTypes[index]['vehicleType'],
                                    quantity: vehicleTypes[index]['quantity']
                                        .toString())),
                          ))
                      .values
                      .toList(),
                ),
                heightSpace(3),
                customText(
                    text: 'What kind of goods can you move?',
                    fontSize: 14,
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
                  onChanged: (val) {
                    whatDoyouMove = val;
                  },
                ),
                heightSpace(3),
                TrackBudiDropdown(
                    validator: dropdownValidation,
                    dropdownList: deliveriesPerMonth,
                    label: 'Deliveries per month',
                    onChange: (val) {
                      _deliveriesPerMonth.text = val.toString();
                    }),
                heightSpace(3),
                TrackBudiDropdown(
                    validator: dropdownValidation,
                    dropdownList: aboutUs,
                    label: 'How did you hear about us',
                    onChange: (val) {
                      _aboutUs.text = val.toString();
                    }),
                heightSpace(3),
                TrackBudiTextFormField(
                  label: 'Enter referral code (Optional)',
                  textEditingController: referralCode,
                ),
                heightSpace(3),
                TrackBudiButton(
                  buttonText: 'I accept',
                  disable: !isButtonDisabled,
                  onTap: onTap,
                ),
                heightSpace(3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    bodyText(text: 'Already have an account?'),
                    widthSpace(2),
                    GestureDetector(
                      onTap: () => context.push(AppRoutes.login),
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
      ),
    );
  }

  onTap() async {
    final logisticsModel = LogisticsModel(
      companyName: _nameOfCompany.text,
      country: _country.text.isEmpty ? "Nigeria" : _country.text,
      address: _address.text,
      landmark: _landMark.text,
      website: _website.text,
      vehicleTypes: newVehicleType,
      goodsType: whatDoyouMove,
      deliveriesPerMonth: _deliveriesPerMonth.text,
      howDidYouHear: _aboutUs.text,
      referralCode: referralCode.text,
      latitude: 0.0,
      longitude: 0.0,
    );
    bool result = await _authRepo.addLogistics(logisticsModel);
    if (result) {
      if (context.mounted) {
        context.push(AppRoutes.guidelinePreview);
      }
    }
  }
}
