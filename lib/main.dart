import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savor_brew/controller/product_cubit.dart';
import 'package:savor_brew/views/auth/login/login_view.dart';
import 'package:savor_brew/views/auth/register/regis.dart';
import 'package:savor_brew/views/navigation_menu.dart';
import 'package:savor_brew/views/onboarding/onboarding_view.dart';
import 'package:savor_brew/views/splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(),
      child: MaterialApp(
        routes: {
          SplashView.id: (context) => const SplashView(),
          OnBoardingView.id: (context) => const OnBoardingView(),
          LoginView.id: (context) => const LoginView(),
          RegisterView.id: (context) => const RegisterView(),
          NavigationMenu.id: (context) => const NavigationMenu(),
        },
        initialRoute: SplashView.id,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
      ),
    );
  }
}
