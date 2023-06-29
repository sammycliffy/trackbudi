import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:trackbudi_vendor/src/config/keys/routes.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/app_images.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/app_spacer.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/colors.dart';
import 'package:trackbudi_vendor/src/features/data/models/otp_model.dart';
import 'package:trackbudi_vendor/src/features/domain/repository/auth_repository.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_divider.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/custom_text.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/phone_number_fileld.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/trackbudi_button.dart';

class PhoneNumber extends HookWidget {
  final AuthRepo _authRepo = AuthRepo();
  final _formKey = GlobalKey<FormState>();
  final _phoneNumber = TextEditingController();

  PhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    String phoneNumber = '';
    String countryCode = '';
    final isButtonEnabled = useState<bool>(false);

    onTap() async {
      bool result =
          await _authRepo.phoneNumberRegister(countryCode, phoneNumber);
      if (result) {
        if (context.mounted) {
          context.push(AppRoutes.otpView,
              extra: OTPModel(isSignup: true, phoneNumber: phoneNumber));
        }
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Form(
          onChanged: () {
            bool isValidated = _formKey.currentState!.validate();
            if (isValidated) {
              isButtonEnabled.value = true;
              return;
            }
            isButtonEnabled.value = false;
          },
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    AppImages.signupHeading,
                    width: 100,
                    height: 100,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(
                            text: 'Signup',
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
              TrackBudiPhoneField(
                onChanged: (phone) {
                  phoneNumber = phone.number;
                  countryCode = phone.countryCode;

                  // log(phone.number.toString());
                  // log(phone.countryCode.toString());
                },
              ),
              heightSpace(4),
              TrackBudiButton(
                  isButtonEnabled: isButtonEnabled.value,
                  buttonText: 'Sign up',
                  onTap: onTap),
              heightSpace(3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  bodyText(text: 'Already have an account?'),
                  widthSpace(2),
                  GestureDetector(
                    child: customText(
                        text: 'Login',
                        fontSize: 14,
                        textColor: AppColors.textPrimary),
                    onTap: () => context.push(AppRoutes.login),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
