import 'package:flutter/material.dart';
import 'package:savor_brew/views/onboarding/widgets/custom_dot.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator(
      {super.key,
      required this.currentPageIndex,
      required this.number,required this.inActiveColor,
      this.mainAxisAlignment});
  final int number;
    final Color inActiveColor;

  final int currentPageIndex;
  final MainAxisAlignment? mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: List.generate(
        number,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 6),
          child: CustomDotIndicator(isActive: index == currentPageIndex, inActiveColor: inActiveColor,),
        ),
      ),
    );
  }
}
