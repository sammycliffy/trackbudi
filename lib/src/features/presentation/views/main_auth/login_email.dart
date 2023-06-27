import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:trackbudi_vendor/src/core/mixin/validators.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/app_images.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/app_spacer.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/colors.dart';
import 'package:trackbudi_vendor/src/features/domain/repository/auth_repository.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_divider.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_textformfield.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/custom_text.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/trackbudi_button.dart';

class LoginEmail extends HookWidget {
  final _emailAddress = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AuthRepo _authRepo = AuthRepo();
  LoginEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final isButtonDisabled = useState<bool>(true);
    final isLoading = useState<bool>(false);
    onTap() async {
      isLoading.value = true;
      isButtonDisabled.value = true;
      bool result =
          await _authRepo.loginWithEmail(_emailAddress.text, _password.text);
    }

    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: () {
            bool isValidated = _formKey.currentState!.validate();
            if (isValidated) {
              isButtonDisabled.value = false;
            }
          },
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
              TrackBudiTextFormField(
                label: 'Email address',
                validator: emailValidation,
                textEditingController: _emailAddress,
              ),
              heightSpace(2),
              TrackBudiTextFormField(
                label: 'Password',
                isPassword: true,
                validator: passwordValidation,
                textEditingController: _password,
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
        ),
      )),
    );
  }

  onTap() {}
}
