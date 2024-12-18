import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:naukri_app/common_widgets/get_appbar_with_title.dart';
import 'package:naukri_app/common_widgets/home_appbar.dart';
import 'package:naukri_app/common_widgets/text_widgets.dart';
import 'package:naukri_app/utils/color_utils.dart';
import 'package:naukri_app/utils/image_utils.dart';
import 'package:naukri_app/utils/size_utils.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
            getAppBarWithTitle(title: 'Profile', context: context),
            Expanded(
              // Wrap Expanded around the ListView
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.0),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            width: 1,
                                            color: ColorUtils.lightGray,
                                          ),
                                          image: DecorationImage(
                                              image:
                                                  AssetImage(ImageUtils.MyPic),
                                              fit: BoxFit.fill)),
                                    ),
                                    Positioned(
                                        bottom: 10,
                                        right: 5,
                                        child: ImageUtils.getImage(
                                            image: ImageUtils.EditIcon,
                                            height: 20))
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: headingH5(
                                        text: 'Chandan Pradhan',
                                        context: context),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: headingH6(
                                        text: 'chandanpradhanbxr@gmail.com',
                                        context: context,
                                        color: ColorUtils.darkGray),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    width: displayWeight(context) / 1.5,
                                    height: 1,
                                    color: ColorUtils.lightGrey,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 0),
                          child: Container(
                            // height: displayHeight(context)/3.8,
                            width: displayWeight(context),

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  blurRadius: 1.0,
                                  spreadRadius: 0.5,
                                ),
                              ],
                            ),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        headingH5(
                                            text: 'About me', context: context),
                                        ImageUtils.getImage(
                                            image: ImageUtils.EditIcon,
                                            height: 15)
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0, vertical: 0),
                                      child: headingH6(
                                          text:
                                              "Hi, I'm Chandan Pradhan, a passionate Flutter Developer with 5 years of experience in building cross-platform mobile applications. I specialize in crafting high-performance, visually appealing apps for both Android and iOS. My expertise spans from UI/UX design to complex app functionalities, and I’m always eager to embrace new challenges and technologies to deliver seamless user experiences.",
                                          context: context,
                                          isSelectable: true,
                                          color: ColorUtils.blackColor),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 20),
                          child: Container(
                            // height: displayHeight(context)/3.8,
                            width: displayWeight(context),

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  blurRadius: 1.0,
                                  spreadRadius: 0.5,
                                ),
                              ],
                            ),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        headingH5(
                                            text: 'Career preferences',
                                            context: context),
                                        ImageUtils.getImage(
                                            image: ImageUtils.EditIcon,
                                            height: 15)
                                      ],
                                    ),
                                    SizedBox(height: 15,),
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    headingH10(text: 'Preferred Location', context: context),
    SizedBox(height: 3,),
     headingH6(text: 'Delhi, Noida, Banglore, Pune, Gurgaon', context: context)
  ],
),
SizedBox(height: 15,),
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    headingH10(text: 'Preferred role', context: context),
    SizedBox(height: 3,),
     headingH6(text: 'Mobile Application Developer, Flutter Developer', context: context)
  ],
),
SizedBox(height: 15,),
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    headingH10(text: 'Preferred role', context: context),
    SizedBox(height: 3,),
     headingH6(text: 'Mobile Application Developer, Flutter Developer', context: context)
  ],
),
SizedBox(height: 15,),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        headingH10(text: 'Preferred annual salary', context: context),
        SizedBox(height: 3,),
         headingH6(text: '₹ 300000', context: context)
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        headingH10(text: 'Employment type', context: context),
        SizedBox(height: 3,),
         headingH6(text: 'Full Time', context: context)
      ],
    ),
  ],
),
SizedBox(height: 15,),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        headingH10(text: 'Job type', context: context),
        SizedBox(height: 3,),
         headingH6(text: 'Contractual, Parmanent', context: context)
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        headingH10(text: 'Preferred shift', context: context),
        SizedBox(height: 3,),
         headingH6(text: 'Day Shift           ', context: context)
      ],
    ),
  ],
),

                                  ],
                                )),
                          ),
                        ),
                     _buildBasicDetailsCard(context),
                     SizedBox(height: 20,),
                     _buildBasicEmployementCard(context),
                       SizedBox(height: 20,),
                     
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

 _buildBasicDetailsCard(context){
  return         Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, ),
                          child: Container(
                            // height: displayHeight(context)/3.8,
                            width: displayWeight(context),

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  blurRadius: 1.0,
                                  spreadRadius: 0.5,
                                ),
                              ],
                            ),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        headingH5(
                                            text: 'Basic details',
                                            context: context),
                                        ImageUtils.getImage(
                                            image: ImageUtils.EditIcon,
                                            height: 15)
                                      ],
                                    ),
                                    SizedBox(height: 15,),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        headingH10(text: 'Total Experience', context: context),
        SizedBox(height: 3,),
         headingH6(text: '1 years 6 months', context: context)
      ],
    ),
     Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    headingH10(text: 'Location', context: context),
    SizedBox(height: 3,),
     headingH6(text: 'New delhi, India', context: context)
  ],
),
  ],
),
SizedBox(height: 15,),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        headingH10(text: 'Contact Number', context: context),
        SizedBox(height: 3,),
         headingH6(text: '+91 9065974832', context: context)
      ],
    ),
    Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    headingH10(text: 'Notice period', context: context),
    SizedBox(height: 3,),
     headingH6(text: '15 days or Less   ', context: context)
  ],
),
   
   
  ],
),



                                  ],
                                )),
                          ),
                        )
                ;
 }
 
 

_buildBasicEmployementCard(context){
  return         Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, ),
                          child: Container(
                            // height: displayHeight(context)/3.8,
                            width: displayWeight(context),

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  blurRadius: 1.0,
                                  spreadRadius: 0.5,
                                ),
                              ],
                            ),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        headingH5(
                                            text: 'Employment',
                                            context: context),
                                        ImageUtils.getImage(
                                            image: ImageUtils.EditIcon,
                                            height: 15)
                                      ],
                                    ),
                                  
Column(
  children: [
    for(int i=0;i<3;i++)
    _companyItem(context)
  ],
)

                                  ],
                                )),
                          ),
                        )
                ;
 }
 
 

_companyItem(context){
  return Padding(
    padding: const EdgeInsets.only(top: 15.0),
    child: Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1,color: ColorUtils.darkGray),
            image: DecorationImage(image: 
            AssetImage(ImageUtils.CompanyLogo),
            fit: BoxFit.contain
            )
          ),
         ),
         SizedBox(width: 20,),
         Expanded(
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headingH5(text: 'Flutter Developer', context: context,
              color: ColorUtils.darkGray),
              headingH6(text: 'Emerald Hills Pvt Ltd.', context: context,color:ColorUtils.darkGray),
              headingH10(text: 'Full-time | jun 2023 - Present | 1 years 7 month', context: context,color:ColorUtils.darkGray)
            
            ],
           ),
         )
        ],
      ),
      SizedBox(height: 10,),
      Container(
        height: 0.2,
        width: displayWeight(context),
        color: ColorUtils.darkGray,
      )
    ],
    ),
  );
}


 }
