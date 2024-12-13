import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naukri_app/utils/color_utils.dart';


Text headingH1({required String text,required BuildContext context}){
  return Text(
    text,
    style: GoogleFonts.inriaSans(
    textStyle: Theme.of(context).textTheme.displayLarge,
    fontSize: 36,
    color: ColorUtils.primaryBlue,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
  ),
  );
}

Text headingH3({required String text,required BuildContext context,
Color color=ColorUtils.primaryBlue

}){
  return Text(
    text,
    style: GoogleFonts.inriaSans(
    textStyle: Theme.of(context).textTheme.displayLarge,
    fontSize: 20,
    color: color,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
  ),
  );
}

Text headingH4({required String text,required BuildContext context}){
  return Text(
    text,
    style: GoogleFonts.lato(
    textStyle: Theme.of(context).textTheme.displayLarge,
    fontSize: 22,
    color: ColorUtils.darkGray,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
  ),
  );

}



Text headingH10({required String text,required BuildContext context,
bool isHyperLink=false,
Color color=ColorUtils.lightGrey

}){
  return Text(
    text,
    style: GoogleFonts.lato(
    textStyle: Theme.of(context).textTheme.displayLarge,
    fontSize: 14,
    color: 
    isHyperLink?ColorUtils.primaryBlue : color,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
  ),
  );

}




Text headingH11({required String text,required BuildContext context,
bool isHyperLink=false,
Color color=ColorUtils.lightGrey

}){
  return Text(
    text,
    style: GoogleFonts.lato(
    textStyle: Theme.of(context).textTheme.displayLarge,
    fontSize: 10,
    color: 
    isHyperLink?ColorUtils.primaryBlue : color,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
  ),
  );

}