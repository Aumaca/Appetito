import 'package:flutter/material.dart';
import 'package:appetito/screens/splash.dart';
import 'package:appetito/screens/login/sign_up.dart';
import 'package:appetito/screens/login/login_controller.dart';

class Routes {
  static const String splash = '/splash';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
}

Map<String, WidgetBuilder> appRoutes = {
  Routes.splash: (context) => const Splash(),
  Routes.welcome: (context) => const LoginController(),
  Routes.login: (context) => const LoginController(initialPage: 1),
  Routes.signup: (context) => const Signup(),
};
