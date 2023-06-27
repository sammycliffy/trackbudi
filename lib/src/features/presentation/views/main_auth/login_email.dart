import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/app_images.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/app_spacer.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/colors.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_divider.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_textformfield.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/custom_text.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/trackbudi_button.dart';

class LoginEmail extends HookWidget {
  const LoginEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final isButtonDisabled = useState<bool>(true);
    final isLoading = useState<bool>(false);
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
            const TrackBudiTextFormField(
              label: 'Email address',
            ),
            heightSpace(2),
            const TrackBudiTextFormField(
              label: 'Password',
            ),
            heightSpace(2),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                  // onTap: () => context.pushRoute(ResetPasswordView()),
                  child: bodyText(text: 'Forgot Password?')),
            ),
            heightSpace(4),
            TrackBudiButton(
                buttonText: 'Login',
                disable: isButtonDisabled.value,
                isLoading: isLoading.value,
                onTap: onTap),
            heightSpace(3),
          ],
        ),
      )),
    );
  }

  onTap() {}
}
