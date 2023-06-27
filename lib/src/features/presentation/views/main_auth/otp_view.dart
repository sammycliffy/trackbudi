import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:trackbudi_vendor/src/config/keys/routes.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/app_images.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/app_spacer.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/colors.dart';
import 'package:trackbudi_vendor/src/features/domain/repository/auth_repository.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_app_bar.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_divider.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/countdown.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/custom_text.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/trackbudi_button.dart';

import '../widgets/otp_widget.dart';

class OTPView extends HookWidget {
  final String phoneNumber;
  final GlobalKey<OTPTimerState> timerkey = GlobalKey();
  final AuthRepo _authRepo = AuthRepo();
  String? otp;

  OTPView({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    final isButtonDisabled = useState<bool>(false);
    final isLoading = useState<bool>(false);
    int timer = 60;

    onTap() async {
      log("Tapped");
      isLoading.value = true;
      isButtonDisabled.value = true;

      bool result = await _authRepo.verifySmsOTP(otp!);

      if (result) {
        if (context.mounted) {
          context.push(AppRoutes.personalInfo);
        }
      }
    }

    resend() async {
      await _authRepo.resendOTP();
    }

    return AbsorbPointer(
      absorbing: false,
      child: Scaffold(
        appBar: appBar(context),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    AppImages.verifyHeading,
                    width: 100,
                    height: 100,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(
                            text: 'Verify code',
                            fontSize: 14,
                            textColor: AppColors.textPrimary),
                        heightSpace(1),
                        bodyText(text: 'Verify your phone number')
                      ],
                    ),
                  )
                ],
              ),
              const AppDivider(),
              heightSpace(6),
              Center(
                child: bodyText(text: 'Enter the code sent to you at'),
              ),
              heightSpace(1),
              Center(
                child: customText(
                    text: phoneNumber,
                    fontSize: 14,
                    textColor: AppColors.textPrimary),
              ),
              heightSpace(3),
              Center(
                child: PinView(onChanged: (val) {
                  otp = val;
                }),
              ),
              heightSpace(4),
              Center(
                child: OTPTimer(
                  key: timerkey,
                  time: timer,
                ),
              ),
              heightSpace(6),
              TrackBudiButton(
                  buttonText: 'Verify and continue',
                  disable: isButtonDisabled.value,
                  isLoading: isLoading.value,
                  onTap: onTap),
              heightSpace(3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  bodyText(text: 'Didn\' receive code?'),
                  widthSpace(2),
                  InkWell(
                    onTap: resend,
                    child: customText(
                        text: 'Request again',
                        fontSize: 14,
                        textColor: AppColors.textPrimary),
                  )
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
