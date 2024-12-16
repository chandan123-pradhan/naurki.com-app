import 'package:flutter/material.dart';
import 'package:naukri_app/common_widgets/search_box.dart';
import 'package:naukri_app/utils/image_utils.dart';
import 'package:naukri_app/utils/size_utils.dart';

Widget getHomeAppBar(context) {
  return SizedBox(
    width: displayWeight(context) / 1,
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ImageUtils.getImage(image: ImageUtils.MenuIcon, height: 20),
          
          SearchBox(
            width: displayWeight(context) / 1.38,
          ),
           ImageUtils.getImage(image: ImageUtils.NotificationIcon, height: 18),

        ],
      ),
    ),
  );
}
