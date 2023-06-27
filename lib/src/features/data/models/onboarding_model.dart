import 'package:trackbudi_vendor/src/core/shared/resources/app_images.dart';

List<OnboardingModel> onboardingModel = [
  OnboardingModel(
      image: AppImages.onboardingImage,
      title: 'Logistics Companies',
      subTitle:
          'Start managing your fleet now. Add your delivery agents and experience real-time tracking of your assets.'),
  OnboardingModel(
      image: AppImages.onboardingImageTwo,
      title: 'Vendors',
      subTitle:
          'E-commerce features built just for you.Set up your store and experience a seamless flow from orders to logistics'),
  OnboardingModel(
      image: AppImages.onboardingImageThree,
      title: 'Riders',
      subTitle:
          'Manage your delivery workload and deliver your packages with real-time visibility.'),
];

class OnboardingModel {
  String image;
  String title;
  String subTitle;
  OnboardingModel({
    required this.image,
    required this.title,
    required this.subTitle,
  });
}
