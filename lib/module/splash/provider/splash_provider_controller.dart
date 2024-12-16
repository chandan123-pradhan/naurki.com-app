import 'package:flutter/material.dart';

class SplashProviderController extends ChangeNotifier {
  // State variable to track if navigation has occurred
  bool isNavigated = false;

  // Method to trigger navigation (after delay)
  void startSplash() async {
    await Future.delayed(const Duration(seconds: 2));
    isNavigated = true;
    notifyListeners(); // Notify listeners (UI) about the state change
  }
}
