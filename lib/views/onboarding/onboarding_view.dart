import 'package:flutter/material.dart';
import 'package:savor_brew/core/utils/app_images.dart';
import 'package:savor_brew/views/onboarding/widgets/onboarding_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static String id = 'onboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(Assets.onboarding),
            opacity: 0.8,
            fit: BoxFit.cover),
      ),
      child: const SafeArea(
        child: OnboardingViewBody(),
      ),
    ));
  }
}
