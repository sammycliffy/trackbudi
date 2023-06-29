import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:trackbudi_vendor/src/config/keys/routes.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/app_images.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/app_spacer.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/colors.dart';
import 'package:trackbudi_vendor/src/features/data/models/otp_model.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_divider.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/custom_text.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/phone_number_fileld.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/trackbudi_button.dart';

import '../../../domain/repository/auth_repository.dart';

class LoginView extends HookWidget {
  final formkey = GlobalKey<FormState>();
  final AuthRepo authRepo = AuthRepo();
  String phoneNumber = '';
  String countryCode = '';
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final isButtonEnabled = useState<bool>(false);

    onTap() async {
      bool result = await authRepo.loginWithPhone(countryCode, phoneNumber);
      if (result) {
        if (context.mounted) {
          context.push(AppRoutes.otpView,
              extra: OTPModel(isSignup: false, phoneNumber: phoneNumber));
        }
      }
    }

    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Form(
        key: formkey,
        onChanged: () {
          bool isValidated = formkey.currentState!.validate();
          if (isValidated) {
            isButtonEnabled.value = true;
            return;
          }
          isButtonEnabled.value = false;
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
                          text: 'Login',
                          fontSize: 14,
                          textColor: AppColors.textPrimary),
                      heightSpace(1),
                      bodyText(
                          text:
                              'Real-time tracking for a stress-free shipping experience')
                    ],
                  ),
                )
              ],
            ),
            const AppDivider(),
            heightSpace(8),
            customText(
                text: 'Phone number',
                fontSize: 11,
                textColor: AppColors.textPrimary),
            heightSpace(1),
            heightSpace(1),
            TrackBudiPhoneField(onChanged: (phone) {
              phoneNumber = phone.number;
              countryCode = phone.countryCode;
            }),
            heightSpace(4),
            TrackBudiButton(
              buttonText: 'Login',
              isButtonEnabled: isButtonEnabled.value,
              onTap: onTap,
            ),
            heightSpace(3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 30.w, child: const AppDivider()),
                widthSpace(6),
                customText(
                    text: 'or', fontSize: 14, textColor: AppColors.textPrimary),
                widthSpace(6),
                SizedBox(width: 30.w, child: const AppDivider()),
              ],
            ),
            heightSpace(4),
            GestureDetector(
              onTap: () => context.push(AppRoutes.loginWithEmail),
              child: Container(
                padding: const EdgeInsets.only(left: 20),
                height: 8.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.textformGrey,
                    ),
                    borderRadius: BorderRadius.circular(28)),
                child: Row(children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.darkBlue),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: SvgPicture.asset(
                        AppImages.messages,
                        height: 10,
                        width: 10,
                      ),
                    ),
                  ),
                  widthSpace(2.h),
                  bodyText(text: 'Login with email')
                ]),
              ),
            ),
            heightSpace(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                bodyText(text: 'Don\'t have an account?'),
                widthSpace(2),
                GestureDetector(
                  onTap: () => context.push(AppRoutes.phoneNumbers),
                  child: customText(
                      text: 'Signup',
                      fontSize: 14,
                      textColor: AppColors.textPrimary),
                )
              ],
            )
          ],
        ),
      ),
    )));
  }
}
