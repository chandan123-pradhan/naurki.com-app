import 'package:flutter/material.dart';
import 'package:naukri_app/module/applies/ui/applies_page.dart';
import 'package:naukri_app/module/home/ui/home_page.dart';
import 'package:naukri_app/module/profile/ui/profile_page.dart';

class DashboardProvider extends ChangeNotifier{
  int currentPage=0;

  List<Widget>screens=[
    HomePage(),
    AppliedPage(),
    ProfilePage(),
    HomePage()
  ];



  void changePage(int page){
    currentPage=page;
    notifyListeners();
  }

}