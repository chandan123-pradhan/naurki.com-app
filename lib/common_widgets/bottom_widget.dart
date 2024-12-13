import 'package:flutter/material.dart';
import 'package:naukri_app/common_widgets/text_widgets.dart';
import 'package:naukri_app/utils/color_utils.dart';
import 'package:naukri_app/utils/size_utils.dart';

class BottomWidget {
  static getMainBottom({required BuildContext context, required String title,
  Color color=ColorUtils.primaryBlue
  }){
    return Container(
      height: 40,
      width: displayWeight(context)/1,
      decoration: BoxDecoration(
         color: color,
        borderRadius: BorderRadius.circular(30)
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(bottom:5.0),
        child: headingH3(text: title, context: context,
        color: ColorUtils.white
        ),
      ),
    );
  }


  static getTransparentBottom({required BuildContext context, required String title}){
    return Container(
      height: 40,
      width: displayWeight(context)/1,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: ColorUtils.primaryBlue
        ),
         color: ColorUtils.white,
        borderRadius: BorderRadius.circular(30)
        
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(bottom:5.0),
        child: headingH3(text: title, context: context,
        color: ColorUtils.lightBlue
        ),
      ),
    );
  }
static getBackBottom(){
  return const Icon(Icons.navigate_before,size:30,
  color: ColorUtils.darkGray,
  
  );
}



}