import 'package:flutter/material.dart';

class FadingText extends StatelessWidget {
  const FadingText({
    super.key,
    required this.fadeAnimation,
  });

  final Animation<double> fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        //animatedbuilder to build this widget only when the value of the animation changes.
        animation: fadeAnimation,
        builder: (context, _) {
          return FadeTransition(
            opacity: fadeAnimation,
            child: const Text(
              'Wake Up and Smell the Coffee!',
              style: TextStyle(
                  fontSize: 16, color: Colors.white, letterSpacing: 1.3),
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
