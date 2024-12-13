import 'package:flutter/material.dart';

class ImateUtils{
  static const String AppLogoImage='assets/icons/app_logo.png';



  static Widget getImage({required String image,double? height, double? width}){
      return Image.asset(image,
      height: height,
      width: width,
      );
  }




}