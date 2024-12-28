import 'package:flutter/material.dart';
import 'package:naukri_app/common_widgets/home_appbar.dart';
import 'package:naukri_app/common_widgets/text_widgets.dart';
import 'package:naukri_app/utils/color_utils.dart';
import 'package:naukri_app/utils/image_utils.dart';
import 'package:naukri_app/utils/size_utils.dart';

class AppliedPage extends StatelessWidget {
  const AppliedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.lightGray,
      body: Container(
        width: displayWeight(context) / 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            getHomeAppBar(context),
            Expanded(
              // Wrap Expanded around the ListView
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: headingH6(
                            context: context,
                            text: 'Your applied jobs',
                            color: ColorUtils.blackColor),
                      ),
                      // const SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap:
                            true, // Makes ListView take only the space it needs
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 20),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return _buildJobCard(context: context);
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildJobCard({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
      
        width: displayWeight(context),
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
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 40,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: ColorUtils.lightGray),
                          image: const DecorationImage(
                              image: AssetImage(
                                ImageUtils.PaytmLogo,
                              ),
                              fit: BoxFit.fill)),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    headingH5(
                        text: 'Backend Software Engineer',
                        context: context,
                        color: ColorUtils.blackColor)
                  ],
                ),
              
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 20,
                          child: ImageUtils.getImage(
                              image: ImageUtils.CompanyLogo, height: 15),
                        ),
                        const SizedBox(
                          width: 35,
                        ),
                        headingH10(
                            text: 'Paytm Limited',
                            context: context,
                            color: ColorUtils.darkGray)
                      ],
                    ),
              

                  ],
                ),
              
                      SizedBox(height: 10,),
                  Row(
                      children: [
                        SizedBox(
                          height: 20,
                          child: ImageUtils.getImage(
                              image: ImageUtils.Status, height: 15),
                        ),
                        const SizedBox(
                          width: 35,
                        ),
                        headingH10(
                            text: 'Applied',
                            context: context,
                            color: ColorUtils.green)
                      ],
                    ),
                           SizedBox(height: 10,),
                  Row(
                      children: [
                        SizedBox(
                          height: 20,
                          child: ImageUtils.getImage(
                              image: ImageUtils.Call, height: 10,width: 20),
                        ),
                        const SizedBox(
                          width: 35,
                        ),
                        headingH10(
                            text: '+91 9065974832',
                            context: context,
                            color: ColorUtils.primaryBlue)
                      ],
                    ),
                    
              ],
            )),
      ),
    );
  }
}
