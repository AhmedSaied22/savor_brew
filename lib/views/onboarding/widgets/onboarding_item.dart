import 'package:flutter/material.dart';
import 'package:savor_brew/core/app_styles.dart';
import 'package:savor_brew/models/onboarding_model.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({super.key, required this.onBoardingModel});
  final OnBoardingModel onBoardingModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * 0.4,
          width: double.infinity,
          // decoration: BoxDecoration(
          //   image: DecorationImage(image: AssetImage(onBoardingModel.image)),
          //   borderRadius: BorderRadius.circular(30),
          //),
        ),
        Spacer(),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.7,
          child: Text(
            onBoardingModel.title,
            style: AppStyles.styleBold32(context),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Text(
            onBoardingModel.subTitle,
            style:
                AppStyles.styleRegular16(context).copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
