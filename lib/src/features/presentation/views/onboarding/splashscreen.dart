import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/app_images.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/app_spacer.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/colors.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/custom_text.dart';

import '../../../../config/keys/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AssetImage? backgroundImage;
  Image? truckImage;
  Image? circle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: backgroundImage!,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(AppImages.splashCircle),
            heightSpace(15),
            Center(
              child: SvgPicture.asset(AppImages.logo),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
              child: customText(
                  text:
                      'The end-to-end solution for logisitics and e-commerce management',
                  fontSize: 20,
                  textColor: AppColors.textPrimary),
            ),
            heightSpace(5),
            Center(child: truckImage),
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(backgroundImage!, context);
    precacheImage(truckImage!.image, context);
  }

  @override
  void initState() {
    super.initState();
    backgroundImage = const AssetImage(AppImages.splashBackground);
    truckImage = Image.asset(
      AppImages.truck,
      width: 50,
      height: 50,
    );

    Timer(const Duration(seconds: 3), () => context.push(AppRoutes.onboarding));
  }
}
