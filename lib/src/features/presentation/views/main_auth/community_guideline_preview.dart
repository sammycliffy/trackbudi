import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:trackbudi_vendor/src/config/keys/routes.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/app_images.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/app_spacer.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/custom_text.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/rowsection.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/trackbudi_button.dart';

import '../../../../core/shared/resources/colors.dart';

class CommunityGuildelinePreview extends StatelessWidget {
  const CommunityGuildelinePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    AppImages.gradientImage,
                  ))),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppImages.arrowBack,
                        color: AppColors.white,
                      ),
                      widthSpace(2),
                      customText(
                          text: 'Back',
                          fontSize: 12,
                          textColor: AppColors.white),
                    ],
                  ),
                ),
                heightSpace(4),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        primaryText(text: 'Community Guidelines'),
                        heightSpace(2),
                        bodyText(
                            text:
                                'TrackBudi is committed to fostering a welcoming and inclusive community for all users. We want to provide a safe and respectful environment where everyone can collaborate and have positive experiences. To ensure a positive experience for everyone, we have established the following community guidelines:'),
                        heightSpace(4),
                        customText(
                            text: 'Respect and Kindness',
                            fontSize: 14,
                            textColor: AppColors.black),
                        heightSpace(2),
                        rowSection(
                            'Treat all users with respect, kindness, and empathy. Engage in constructive and courteous discussions. Avoid personal attacks, harassment, bullying, or discriminatory language based on race, ethnicity, gender, religion, sexual orientation, or any other characteristic.'),
                        heightSpace(4),
                        customText(
                            text: 'Honesty and Truth',
                            fontSize: 14,
                            textColor: AppColors.black),
                        heightSpace(2),
                        rowSection(
                            'Do not share false or misleading information. Ensure your provided details, content and data are valid and represent the correct and accurate circumstances. Impersonating users or third parties is expressly forbidden.'),
                        heightSpace(4),
                        TrackBudiButton(
                          onTap: () => context.push(AppRoutes.commuinityGuide),
                          buttonText: 'Continue to read',
                        )
                      ]),
                )
              ],
            ),
          )),
    );
  }
}
