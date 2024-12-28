import 'package:flutter/material.dart';
import 'package:naukri_app/module/alerts/ui/create_alert_page.dart';
import 'package:naukri_app/module/auth/ui/complete_profile.dart';
import 'package:naukri_app/module/auth/ui/login_page.dart';
import 'package:naukri_app/module/auth/ui/register_page.dart';
import 'package:naukri_app/module/home/ui/find_job.dart';
import 'package:naukri_app/module/job_details/ui/job_details_page.dart';
import 'package:naukri_app/module/splash/ui/splash_page.dart';
import 'package:naukri_app/module/dashboard/ui/dashboard_page.dart'; // Example home page

class AppRoutes {
  static const String splashPage = '/';
  static const String loginPage = '/login';
  static const String regisePage='/register_page';
  static const String completeProfilePage='/complete_profile_page';
  static const String dashboardPage='/dashboard';
  static const String jobDetailsPage='/job_details';
  static const String finJobsPage='/find_jobs';
  static const String createAlert='/create_alert';

  static Map<String, WidgetBuilder> get routes {
    return {
      splashPage: (context) => const SplashPage(),
      loginPage: (context) => const LoginPage(),
      regisePage:(context)=>const SignupPage(),
      completeProfilePage:(context)=>const CompleteProfilePage(),
      dashboardPage:(context)=>const DashboardPage(),
      jobDetailsPage:(context)=>const JobDetailsPage(),
      finJobsPage:(context)=>const FindJobPage(),
      createAlert:(context)=>const CreateAlertPage()
      
    };
  }
}
