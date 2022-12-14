// ignore_for_file: constant_identifier_names

import 'package:fin_app/presentation/screens/login_screen/login_screen.dart';
import 'package:fin_app/presentation/screens/main_screen/main_screen.dart';
import 'package:fin_app/presentation/screens/splash_screen/splash_screen.dart';

import 'package:flutter/material.dart';

class AppRouter {
  static const SPLASH_SCREEN = '/';
  static const MAIN_SCREEN = '/home';
  static const LOGIN_SCREEN = '/login';

  static Route? onGenrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SPLASH_SCREEN:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case MAIN_SCREEN:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case LOGIN_SCREEN:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      default:
        return null;
    }
  }
}

class AppNavigator {
  static pop(BuildContext context) {
    Navigator.pop(context);
  }

  static push(BuildContext context, String name, {ScreenParams? args}) {
    Navigator.pushNamed(context, name, arguments: args);
  }

  static pushReplacement(BuildContext context, String name,
      {ScreenParams? args}) {
    Navigator.pushReplacementNamed(context, name, arguments: args);
  }
}

class ScreenParams {
  final Map<String, dynamic> args;
  const ScreenParams(this.args);
}
