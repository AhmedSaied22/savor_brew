import 'dart:async';

import 'package:flutter/material.dart';
import 'package:savor_brew/views/auth/login/login_view.dart';
import 'package:savor_brew/views/onboarding/widgets/dots_indicator.dart';
import 'package:savor_brew/views/onboarding/widgets/onboarding_section.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({
    super.key,
  });

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  int currentPageIndex = 0;
  late PageController pageController;
  late Timer timer;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPageIndex = pageController.page!.round();

      setState(() {});
    });
    startAutoScrollTimer();
    super.initState();
  }

  @override
  void dispose() {
    // Cancel the automatic scroll timer
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: OnboardingSection(
              controller: pageController,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DotsIndicator(
                currentPageIndex: currentPageIndex,
                number: 3,
                inActiveColor: Colors.white,
              ),
              const SizedBox(
                height: 20,
              ),
              IconButton(
                color: const Color.fromARGB(255, 59, 31, 21),
                icon: const Icon(Icons.arrow_circle_right_rounded, size: 45),
                onPressed: () {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeInOut);

                  if (currentPageIndex == 2) {
                    // GoRouter.of(context).pushReplacement(AppRouter.kSignUpView);
                  }
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  void startAutoScrollTimer() {
    const autoScrollDuration = Duration(seconds: 5);
    const scrollDuration = Duration(milliseconds: 600);

    timer = Timer(autoScrollDuration, () {
      if (currentPageIndex < 2) {
        pageController.nextPage(
            duration: scrollDuration, curve: Curves.easeInOut);
        startAutoScrollTimer();
      } else {
        Navigator.pushReplacementNamed(context, LoginView.id);
      }
    });
  }
}
