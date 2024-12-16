import 'package:flutter/material.dart';
import 'package:naukri_app/module/auth/provider/auth_provider_controller.dart';
import 'package:naukri_app/module/auth/ui/complete_profile.dart';
import 'package:naukri_app/module/dashboard/provider/dashboard_provider.dart';
import 'package:naukri_app/module/splash/provider/splash_provider_controller.dart';
import 'package:naukri_app/utils/app_routes.dart';
import 'package:provider/provider.dart';  // Import the provider package

void main() {
  runApp(
    // Wrap the entire app in ChangeNotifierProvider
   MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SplashProviderController()),
        ChangeNotifierProvider(create: (context)=>AuthProviderController()),
        ChangeNotifierProvider(create: (context)=>DashboardProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Naukri App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: AppRoutes.routes,  // Include your AppRoutes
      initialRoute: AppRoutes.splashPage,  // Set the initial route to SplashPage
    );
  }
}
