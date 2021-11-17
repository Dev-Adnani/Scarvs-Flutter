import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:scarvs/presentation/screens/ProductsScreen/products.screen.dart';
import 'package:scarvs/presentation/screens/cartScreen/cart.screen.dart';
import 'package:scarvs/presentation/screens/favouriteScreen/favourite.screen.dart';
import 'package:scarvs/presentation/screens/homeScreen/home.screen.dart';
import 'package:scarvs/presentation/screens/loginScreen/login.view.dart';
import 'package:scarvs/presentation/screens/onBoardingScreen/onBoarding.screen.dart';
import 'package:scarvs/presentation/screens/profileScreen/profile.screen.dart';
import 'package:scarvs/presentation/screens/searchScreen/search.screen.dart';
import 'package:scarvs/presentation/screens/signUpScreen/signup.screen.dart';
import 'package:scarvs/presentation/screens/splashScreen/splash.screen.dart';

class AppRouter {
  static const String splashRoute = "/splash";
  static const String onBoardRoute = "/onBoard";
  static const String productRoute = "/product";
  static const String loginRoute = "/login";
  static const String signUpRoute = "/signup";
  static const String homeRoute = "/home";
  static const String cartRoute = "/cart";
  static const String favRoute = "/fav";
  static const String searchRoute = "/search";
  static const String profileRoute = "/profile";

  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        {
          return MaterialPageRoute(
            builder: (_) => HomeScreen(),
          );
        }
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
      case productRoute:
        {
          return MaterialPageRoute(
            builder: (_) => ProductScreen(),
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
      case favRoute:
        {
          return MaterialPageRoute(builder: (_) => FavScreen());
        }
      case cartRoute:
        {
          return MaterialPageRoute(builder: (_) => CartScreen());
        }
      case searchRoute:
        {
          return MaterialPageRoute(builder: (_) => SearchScreen());
        }
      case profileRoute:
        {
          return MaterialPageRoute(builder: (_) => ProfileScreen());
        }
    }
  }
}
