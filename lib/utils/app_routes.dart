import 'package:flutter/material.dart';
import 'package:naukri_app/module/auth/ui/complete_profile.dart';
import 'package:naukri_app/module/auth/ui/login_page.dart';
import 'package:naukri_app/module/auth/ui/register_page.dart';
import 'package:naukri_app/module/splash/ui/splash_page.dart';
import 'package:naukri_app/module/dashboard/ui/dashboard_page.dart'; // Example home page

class AppRoutes {
  static const String splashPage = '/';
  static const String loginPage = '/login';
  static const String regisePage='/register_page';
  static const String completeProfilePage='/complete_profile_page';
  static const String dashboardPage='/dashboard';

  static Map<String, WidgetBuilder> get routes {
    return {
      splashPage: (context) => const SplashPage(),
      loginPage: (context) => const LoginPage(),
      regisePage:(context)=>const SignupPage(),
      completeProfilePage:(context)=>const CompleteProfilePage(),
      dashboardPage:(context)=>const DashboardPage()
    };
  }
}
