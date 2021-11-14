import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:scarvs/presentation/screens/homeScreen/home.screen.dart';
import 'package:scarvs/presentation/screens/loginScreen/login.view.dart';
import 'package:scarvs/presentation/screens/onBoardingScreen/onBoarding.screen.dart';
import 'package:scarvs/presentation/screens/signUpScreen/signup.screen.dart';
import 'package:scarvs/presentation/screens/splashScreen/splash.screen.dart';

class AppRouter {
  static const String splashRoute = "/splash";
  static const String onBoardRoute = "/onBoard";
  static const String homeRoute = "/home";
  static const String loginRoute = "/login";
  static const String signUpRoute = "/signup";

  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        {
          return ConcentricPageRoute(
            fullscreenDialog: true,
            builder: (_) => const SplashScreen(),
          );
        }
      case onBoardRoute:
        {
          return MaterialPageRoute(
            builder: (_) => OnBoardingScreen(),
          );
        }
      case homeRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const HomeScreen(),
          );
        }
      case loginRoute:
        {
          return MaterialPageRoute(builder: (_) => LoginScreen());
        }
      case signUpRoute:
        {
          return MaterialPageRoute(builder: (_) => SignUpScreen());
        }
    }
  }
}
