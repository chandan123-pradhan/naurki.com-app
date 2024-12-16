import 'package:flutter/material.dart';
import 'package:naukri_app/common_widgets/text_widgets.dart';
import 'package:naukri_app/utils/image_utils.dart';

class SearchBox extends StatelessWidget {
  double? width;
  double? height;
  SearchBox({this.height,this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height??35,
      width: width,
      
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left:10.0),
        child: Row(
          children: [
           ImageUtils.getImage(image: ImageUtils.SearchIcon,
           height: 20,
           width: 20
           ),
           SizedBox(width: 10,),
           headingH10(text: 'Search', context: context)
          ],
        ),
      ),
    
    );
  }
}