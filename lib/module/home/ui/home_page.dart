import 'package:flutter/material.dart';
import 'package:naukri_app/common_widgets/home_appbar.dart';
import 'package:naukri_app/common_widgets/text_widgets.dart';
import 'package:naukri_app/utils/color_utils.dart';
import 'package:naukri_app/utils/image_utils.dart';
import 'package:naukri_app/utils/size_utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            text: 'Recomended jobs based on your profile',
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
                    SizedBox(height: 5,),
                  Row(
                      children: [
                        SizedBox(
                          height: 20,
                          child: ImageUtils.getImage(
                              image: ImageUtils.Experience, height: 15),
                        ),
                        const SizedBox(
                          width: 35,
                        ),
                        headingH10(
                            text: 'more than 2 years',
                            context: context,
                            color: ColorUtils.darkGray)
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
                    SizedBox(width: 20,),
 Row(
                  children: [
                    SizedBox(
                    
                      child: ImageUtils.getImage(
                          image: ImageUtils.StartLogo, height: 10),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    headingH11(
                        text: '4.5',
                        context: context,
                        color: ColorUtils.darkGray)
                  ],
                )


                  ],
                ),
                SizedBox(height: 10,),
                  Row(
                      children: [
                        SizedBox(
                          height: 20,
                          child: ImageUtils.getImage(
                              image: ImageUtils.LocationLogo, height: 15),
                        ),
                        const SizedBox(
                          width: 35,
                        ),
                        headingH10(
                            text: 'Noida sector 66, (201301)',
                            context: context,
                            color: ColorUtils.darkGray)
                      ],
                    ),
                      SizedBox(height: 10,),
                  Row(
                      children: [
                        SizedBox(
                          height: 20,
                          child: ImageUtils.getImage(
                              image: ImageUtils.Profile, height: 15),
                        ),
                        const SizedBox(
                          width: 35,
                        ),
                        headingH10(
                            text: '5+ Openings',
                            context: context,
                            color: ColorUtils.darkGray)
                      ],
                    ),
                    
              ],
            )),
      ),
    );
  }
}
