import 'package:flutter/material.dart';
import 'package:naukri_app/ui/auth/login_page.dart';
import 'package:naukri_app/ui/auth/register_page.dart';
import 'package:naukri_app/ui/splash/ui/splash_page.dart';
import 'package:naukri_app/ui/home_ui/home_page.dart'; // Example home page

class AppRoutes {
  static const String splashPage = '/';
  static const String loginPage = '/login';
  static const String regisePage='/register_page';

  static Map<String, WidgetBuilder> get routes {
    return {
      splashPage: (context) => const SplashPage(),
      loginPage: (context) => const LoginPage(),
      regisePage:(context)=>const SignupPage()
    };
  }
}
