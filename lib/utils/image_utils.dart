import 'package:flutter/material.dart';

class ImageUtils{
  static const String AppLogoImage='assets/icons/app_logo.png';
  static const String SearchIcon='assets/icons/search.png';
  static const String MenuIcon='assets/icons/menu.png';
  static const String HomeIcon='assets/icons/home.png';
  static const String SelectedHome='assets/icons/selected_home.png';
  static const String Applied='assets/icons/apply.png';
  static const String SelectedApplies='assets/icons/selected_applied.png';
  static const String Profile='assets/icons/profile.png';
  static const String SelectedProfile='assets/icons/selected_profile.png';
  static const String NotificationIcon='assets/icons/notification.png';
  static const String SelectedNotificationIcon='assets/icons/selected_notification.png';
  static const String PaytmLogo='assets/icons/paytm_logo.png';
  static const String CompanyLogo='assets/icons/office.png';
  static const String StartLogo='assets/icons/star.png';
  static const String LocationLogo='assets/icons/location.png';
  static const String Experience='assets/icons/experience.png';
  static const String Status='assets/icons/status.png';
  static const String Call='assets/icons/call.png';
  static Widget getImage({required String image,double? height, double? width}){
      return Image.asset(image,
      height: height,
      width: width,
      );
  }




}