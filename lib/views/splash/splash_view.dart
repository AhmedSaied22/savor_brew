import 'package:flutter/material.dart';
import 'package:savor_brew/views/splash/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
    static String id = 'SplashView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.brown,
      body: SplashViewBody(),
    );
  }
}
