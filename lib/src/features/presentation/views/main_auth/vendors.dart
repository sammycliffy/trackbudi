import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trackbudi_vendor/src/config/keys/routes.dart';
import 'package:trackbudi_vendor/src/core/mixin/validators.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/app_images.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/app_spacer.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/colors.dart';
import 'package:trackbudi_vendor/src/features/data/models/vendor_model.dart';
import 'package:trackbudi_vendor/src/features/domain/repository/auth_repository.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_app_bar.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_country_widget.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_divider.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_textformfield.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/custom_text.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/custom_vendor_widget.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/dropdown_search.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/trackbudi_button.dart';

class VendorRegistration extends StatefulWidget {
  const VendorRegistration({super.key});

  @override
  State<VendorRegistration> createState() => _VendorRegistrationState();
}

class _VendorRegistrationState extends State<VendorRegistration> {
  final _businessName = TextEditingController();
  bool isButtonEnabled = false;
  List<String> typeOfGoods = [];
  final _formKey = GlobalKey<FormState>();
  final _country = TextEditingController();
  final AuthRepo _authRepo = AuthRepo();

  List<PickupAddresses> pickuplocation = [
    PickupAddresses(address: "", landmark: "", latitude: 0, longitude: 0)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            onChanged: () {
              isButtonEnabled = _formKey.currentState!.validate();
              setState(() {});
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      AppImages.logisticsHeading,
                      width: 100,
                      height: 100,
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
                heightSpace(3),
                TrackBudiTextFormField(
                  textEditingController: _businessName,
                  label: 'Business name',
                  validator: stringValidation,
                ),
                heightSpace(2),
                customText(
                    text: "Type of goods",
                    fontSize: 14,
                    textColor: AppColors.darkBlue),
                heightSpace(2),
                TrackBudiDropdDownSearch(
                  onChanged: (val) => onChanged(val),
                ),
                heightSpace(2),
                customText(
                    text: 'Select country',
                    fontSize: 14,
                    textColor: AppColors.textPrimary),
                heightSpace(2),
                CountryWidget(selectCountry: (val) => _country.text = val!),
                heightSpace(2),
                customText(
                    text: 'Pickup Address',
                    fontSize: 14,
                    textColor: AppColors.textPrimary),
                heightSpace(2),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.textformGrey)),
                  child: Column(children: [
                    ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 10),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: pickuplocation.length,
                      itemBuilder: (context, index) {
                        return CustomVendorPickAddressWidget(
                          landmark: (val) =>
                              pickuplocation[index].landmark = val,
                          address: (val) => pickuplocation[index].address = val,
                          remove: () {
                            if (pickuplocation.length == 1) return;
                            pickuplocation.removeAt(index);
                            setState(() {});
                          },
                        );
                      },
                    ),
                    heightSpace(2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        bodyText(text: 'Add another pickup address'),
                        GestureDetector(
                          onTap: () {
                            pickuplocation.add(PickupAddresses(
                                address: "",
                                landmark: "",
                                latitude: 0,
                                longitude: 0));

                            setState(() {});
                          },
                          child: Container(
                              padding: const EdgeInsets.only(bottom: 2),
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, border: Border.all()),
                              child: Center(
                                child: customText(
                                    text: '+',
                                    fontSize: 15,
                                    textColor: AppColors.black),
                              )),
                        )
                      ],
                    )
                  ]),
                ),
                heightSpace(3),
                TrackBudiButton(
                  buttonText: 'Confirm',
                  isButtonEnabled: isButtonEnabled,
                  onTap: onTap,
                ),
                heightSpace(3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    bodyText(text: 'Already have an account?'),
                    widthSpace(2),
                    customText(
                        text: 'Login',
                        fontSize: 14,
                        textColor: AppColors.textPrimary),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  onChanged(List<String>? list) {
    typeOfGoods = list!;
    log(list.toString());
  }

  onTap() async {
    if (_formKey.currentState!.validate()) {
      final vendorModel = VendorModel(
          country: _country.text.isEmpty ? "Nigeria" : _country.text,
          businessName: _businessName.text,
          pickupAddresses: pickuplocation,
          userType: "Vendor/SMB",
          goodsType: typeOfGoods);

      bool result = await _authRepo.registerVendor(vendorModel);
      if (result) {
        if (context.mounted) {
          context.push(AppRoutes.guidelinePreview);
        }
      }
    }
  }
}
