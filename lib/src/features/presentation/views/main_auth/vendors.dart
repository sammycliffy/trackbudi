import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/app_images.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/app_spacer.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/colors.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_app_bar.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_country_widget.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_divider.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_dropdown.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_textformfield.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/custom_text.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/custom_vendor_widget.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/trackbudi_button.dart';

class VendorRegistration extends HookWidget {
  final pickUpLocation = ["Address", "Address 2", "Address"];

  VendorRegistration({super.key});
  @override
  Widget build(BuildContext context) {
    final isButtonDisabled = useState<bool>(false);
    final isLoading = useState<bool>(true);
    return Scaffold(
      appBar: appBar(context),
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
              heightSpace(6),
              const TrackBudiTextFormField(
                label: 'Business name',
              ),
              heightSpace(2),
              TrackBudiDropdown(
                dropdownList: const [
                  "Category A",
                  "category B",
                  "category C",
                  "category D"
                ],
                label: 'Category',
                onChange: (val) => log(val.toString()),
              ),
              heightSpace(2),
              customText(
                  text: 'Select country',
                  fontSize: 11,
                  textColor: AppColors.textPrimary),
              heightSpace(2),
              CountryWidget(selectCountry: (val) => log(val.toString())),
              heightSpace(2),
              customText(
                  text: 'Pickup Address',
                  fontSize: 11,
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
                    itemCount: pickUpLocation.length,
                    itemBuilder: (context, index) {
                      var d = pickUpLocation[index];
                      // log('id: ${d.id}');
                      return const CustomVendorPickAddressWidget(
                          // key: ValueKey(d.id),
                          key: ValueKey("222")
                          // landmark: "landmark",
                          // address: (p0) => ref
                          //     .read(authNotifier.notifier)
                          //     .vendorPickupAdressF(d.id, p0),
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
                          // var id = uid.Uuid().v1();
                          // log('id ::$id');
                          // ref.read(authNotifier.notifier).addMapToList(
                          //     state.listOfpickupAddressModel,
                          //     PickupAddressModel(id: id));
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
                                  fontSize: 17,
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
                disable: isButtonDisabled.value,
                isLoading: isLoading.value,
                // onTap: state.displayvendorButton
                //     ? () {
                //         ref
                //             .read(authNotifier.notifier)
                //             .mapEventsToState(CreateOrUpdateVendorEvent());
                //       }
                //     : () {}
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
    );
  }
}
