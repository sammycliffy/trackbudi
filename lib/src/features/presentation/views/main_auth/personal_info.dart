import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:trackbudi_vendor/src/config/keys/routes.dart';
import 'package:trackbudi_vendor/src/core/mixin/validators.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/app_images.dart';
import 'package:trackbudi_vendor/src/features/domain/repository/auth_repository.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_app_bar.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_divider.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_textformfield.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/checkbox.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/custom_text.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/toast.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/trackbudi_button.dart';

import '../../../../core/shared/resources/app_spacer.dart';
import '../../../../core/shared/resources/colors.dart';

class PersonalInfo extends HookWidget {
  final _formKey = GlobalKey<FormState>();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  final AuthRepo _authRepo = AuthRepo();
  bool _isChecked = false;

  PersonalInfo({super.key});
  @override
  Widget build(BuildContext context) {
    isCheckedState(value) {
      _isChecked = value;
    }

    onTap() async {
      if (_formKey.currentState!.validate()) {
        if (!_isChecked) {
          ToastResp.toastMsgError(
              resp: "You should accept the agree with the terms & conditions");
          return;
        }
        bool result = await _authRepo.registerUser(
            firstName: _firstName.text,
            lastName: _lastName.text,
            email: _email.text,
            password: _password.text,
            confirmPassword: _confirmPassword.text);

        if (result && context.mounted) {
          context.push(AppRoutes.accountSelection);
        }
      }
    }

    return Scaffold(
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Form(
            // onChanged: () {
            //   bool isValidated = _formKey.currentState!.validate();
            //   if (isValidated && _isChecked) {
            //     isButtonEnabled.value = true;
            //     return;
            //   }
            //   isButtonEnabled.value = false;
            // },
            key: _formKey,
            child: Column(
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
                              text: 'Provide your personal details',
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
                  label: 'First name',
                  textEditingController: _firstName,
                  validator: stringValidation,
                ),
                heightSpace(2),
                TrackBudiTextFormField(
                  label: 'Last name',
                  textEditingController: _lastName,
                  validator: stringValidation,
                ),
                heightSpace(2),
                TrackBudiTextFormField(
                  label: 'Email address',
                  textEditingController: _email,
                  validator: emailValidation,
                ),
                heightSpace(2),
                TrackBudiTextFormField(
                  label: 'Password',
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                  textEditingController: _password,
                  validator: passwordValidation,
                ),
                heightSpace(2),
                TrackBudiTextFormField(
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                  textEditingController: _confirmPassword,
                  validator: (val) {
                    if (_password.text != val) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                  label: 'Confirm Password',
                ),
                heightSpace(6),
                Row(
                  children: [
                    TrackbudiCheckbox(
                      isCheckedState: (val) => isCheckedState(val),
                    ),
                    widthSpace(2),
                    bodyText(text: 'I agree with the', fontSize: 11),
                    widthSpace(1),
                    customText(
                        text: 'Terms and Conditions',
                        fontSize: 11,
                        textColor: AppColors.primary),
                    widthSpace(1),
                    customText(
                        text: '&',
                        fontSize: 11,
                        textColor: AppColors.textPrimary),
                    widthSpace(1),
                    customText(
                        text: 'Privacy Policy',
                        fontSize: 11,
                        textColor: AppColors.primary),
                  ],
                ),
                heightSpace(3),
                TrackBudiButton(
                  onTap: onTap,
                  buttonText: 'Confirm',
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
                heightSpace(8)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
