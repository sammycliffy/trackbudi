import 'package:go_router/go_router.dart';
import 'package:trackbudi_vendor/src/config/keys/routes.dart';
import 'package:trackbudi_vendor/src/features/data/models/otp_model.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/main_auth/account_selection.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/main_auth/community_guideline.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/main_auth/login_email.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/main_auth/login_view.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/main_auth/logistics.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/main_auth/otp_view.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/main_auth/personal_info.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/main_auth/phone_number.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/main_auth/vendors.dart';

import '../../features/presentation/views/main_auth/community_guideline_preview.dart';
import '../../features/presentation/views/onboarding/onboarding.dart';
import '../../features/presentation/views/onboarding/splashscreen.dart';

GoRouter router() => GoRouter(routes: <GoRoute>[
      GoRoute(
          name: AppRoutes.splashScreen,
          path: AppRoutes.splashScreen,
          builder: (_, state) => const SplashScreen()),
      GoRoute(
          name: AppRoutes.onboarding,
          path: AppRoutes.onboarding,
          builder: (_, state) => const OnboardingScreen()),
      GoRoute(
          name: AppRoutes.phoneNumbers,
          path: AppRoutes.phoneNumbers,
          builder: (_, state) => PhoneNumber()),
      GoRoute(
          name: AppRoutes.otpView,
          path: AppRoutes.otpView,
          builder: (_, state) => OTPView(
                otpModel: state.extra as OTPModel,
              )),
      GoRoute(
          name: AppRoutes.personalInfo,
          path: AppRoutes.personalInfo,
          builder: (_, state) => PersonalInfo()),
      GoRoute(
          name: AppRoutes.accountSelection,
          path: AppRoutes.accountSelection,
          builder: (_, state) => const AccountSelection()),
      GoRoute(
          name: AppRoutes.login,
          path: AppRoutes.login,
          builder: (_, state) => LoginView()),
      GoRoute(
          name: AppRoutes.vendor,
          path: AppRoutes.vendor,
          builder: (_, state) => const VendorRegistration()),
      GoRoute(
          name: AppRoutes.logistics,
          path: AppRoutes.logistics,
          builder: (_, state) => const Logistics()),
      GoRoute(
          name: AppRoutes.loginWithEmail,
          path: AppRoutes.loginWithEmail,
          builder: (_, state) => LoginEmail()),
      GoRoute(
          name: AppRoutes.commuinityGuide,
          path: AppRoutes.commuinityGuide,
          builder: (_, state) => const CommunityGuideline()),
      GoRoute(
          name: AppRoutes.guidelinePreview,
          path: AppRoutes.guidelinePreview,
          builder: (_, state) => const CommunityGuildelinePreview()),
    ]);
