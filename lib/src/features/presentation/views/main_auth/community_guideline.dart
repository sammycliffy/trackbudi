import 'package:flutter/material.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/app_spacer.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/colors.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/app_app_bar.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/custom_text.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/rowsection.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/trackbudi_button.dart';

class CommunityGuideline extends StatelessWidget {
  const CommunityGuideline({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
            customText(
                text: 'Privacy and Confidentiality ',
                fontSize: 14,
                textColor: AppColors.black),
            heightSpace(2),
            rowSection(
                'Respect the privacy and confidentiality of others. Do not share personal information, sensitive data, or any confidential information without proper authorization. Be mindful of sharing location-based information and consider the privacy of yourself and others.'),
            heightSpace(4),
            customText(
                text: 'No Exchange of Illegal Goods and Services',
                fontSize: 14,
                textColor: AppColors.black),
            heightSpace(2),
            rowSection(
                'Illegal Substances, firearms, hard drugs or counterfeit documents must not be exchanged. Any goods or services provided on Trackbudi must not feature items such as firearms, explosives, unlicensed medical pharmaceuticals or devices or any others within the aforementioned categories.'),
            heightSpace(4),
            customText(
                text: 'No Spam or Self-promotion',
                fontSize: 14,
                textColor: AppColors.black),
            heightSpace(2),
            rowSection(
                'Avoid spamming or excessive self-promotion. Do not engage in unsolicited advertising, solicitation, or link to external websites or services unrelated to TrackBudi. The community should be a space for genuine interaction and discussion.'),
            heightSpace(4),
            customText(
                text: 'Reporting and Moderation',
                fontSize: 14,
                textColor: AppColors.black),
            heightSpace(2),
            rowSection(
                'If you come across any violations of these guidelines or witness inappropriate behavior, report it to the TrackBudi support team at safety@trackbudi.com. Do not take matters into your own hands or engage in public confrontations. Your cooperation is essential in maintaining a healthy community.'),
            heightSpace(4),
            customText(
                text: 'Compliance with Laws',
                fontSize: 14,
                textColor: AppColors.black),
            heightSpace(2),
            rowSection(
                'Adhere to all applicable laws, regulations, and legal obligations while using TrackBudi. Do not engage in any activities that are unlawful or violate the terms of service.'),
            heightSpace(2),
            rowSection(
                'Everyone on TrackBudi must follow these guidelines, and they apply to all parts of our platform. Failure to comply with these guidelines may result in warnings, temporary or permanent suspensions, or account termination, depending on the severity of the violation.'),
            heightSpace(2),
            rowSection(
                "Remember, TrackBudi is a collaborative platform meant to empower and connect users. Let's work together to create a vibrant, supportive, and inclusive community. Thank you for being a part of TrackBudi!"),
            heightSpace(5),
            const TrackBudiButton(
              buttonText: "I Accept",
            )
          ],
        ),
      )),
    );
  }
}
