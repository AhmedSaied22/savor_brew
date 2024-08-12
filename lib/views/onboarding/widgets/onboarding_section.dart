import 'package:flutter/material.dart';
import 'package:savor_brew/core/utils/app_images.dart';
import 'package:savor_brew/models/onboarding_model.dart';
import 'package:savor_brew/views/onboarding/widgets/onboarding_item.dart';

class OnboardingSection extends StatefulWidget {
  const OnboardingSection({
    super.key,
    this.controller,
  });
  final PageController? controller;
  static const List<OnBoardingModel> items = [
    OnBoardingModel(
      image: Assets.logo,
      title: 'OUR SLOGAN',
      subTitle: 'Your Daily Dose of Delight',
    ),
    OnBoardingModel(
      image: Assets.logo,
      title: 'SAVOR BREW',
      subTitle: 'Coffee Crafted with Passion',
    ),
    OnBoardingModel(
      image: Assets.logo,
      title: 'Smile',
      subTitle: 'Where Every Sip is a Smile.',
    )
  ];

  @override
  State<OnboardingSection> createState() => _OnboardingSectionState();
}

class _OnboardingSectionState extends State<OnboardingSection> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: widget.controller,
        itemCount: OnboardingSection.items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: OnboardingItem(
              onBoardingModel: OnboardingSection.items[index],
            ),
          );
        });
  }
}
