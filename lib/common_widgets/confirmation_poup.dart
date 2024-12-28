import 'package:flutter/cupertino.dart';
import 'package:naukri_app/common_widgets/bottom_widget.dart';
import 'package:naukri_app/common_widgets/text_widgets.dart';
import 'package:naukri_app/utils/color_utils.dart';
import 'package:naukri_app/utils/image_utils.dart';
import 'package:naukri_app/utils/size_utils.dart';

class AlertCreateConfirmationPopup extends StatelessWidget {
  const AlertCreateConfirmationPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    
      height: displayHeight(context)/3,
      width: displayWeight(context)/1,
      decoration: const BoxDecoration(
          color: ColorUtils.lightGray,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30)
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            headingH5(text: 'Alert Created Sucessfully Done!', context: context),
            ImageUtils.getLottie(file: ImageUtils.SubmitLottie,
            height: displayWeight(context)/3.5,
            width: displayWeight(context)/3.5
            ), 
           headingH10(text: "Your jobs request is sent to many companies\nWe'll get your job soon!", context: context,
           
           ),
       
             BottomWidget.getMainBottom(
                      context: context,
                      title: 'Thanks',
                      onPressed: (){
Navigator.pop(context);
                      }
                    ),
          ],
        ),
      ),
    );
  }
}