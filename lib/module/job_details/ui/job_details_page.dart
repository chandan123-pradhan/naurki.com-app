import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:naukri_app/common_widgets/bottom_widget.dart';
import 'package:naukri_app/common_widgets/text_widgets.dart';
import 'package:naukri_app/utils/color_utils.dart';
import 'package:naukri_app/utils/image_utils.dart';
import 'package:naukri_app/utils/size_utils.dart';

class JobDetailsPage extends StatelessWidget {
  const JobDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.lightGray,
      appBar: AppBar(
        backgroundColor: ColorUtils.lightGray,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.navigate_before,
            size: 30,
            color: ColorUtils.darkGray,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.share_outlined,
              size: 20,
              color: ColorUtils.darkGray,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCompanyNameAndLogoWidget(context),
              SizedBox(
                height: 20,
              ),
              _buildRequirementsWidget(context),
              SizedBox(
                height: 10,
              ),
              Divider(),
              _buildAboutCompany(context)
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: ColorUtils.lightGray,
        child: Container(
          // height: 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                BottomWidget.getMainBottom(
                context: context,
                color: ColorUtils.primaryBlue,
                onPressed: (){},
                title: 'Apply',
                width: displayWeight(context)/1.15
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildAboutCompany(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headingH5(text: 'About us', context: context),
        SizedBox(
          height: 10,
        ),
        headingH6(
            text:
                'HCL was one of the first IT startups in India and is known for its many innovations in computing. In 1978, HCL introduced an 8-bit microcomputer, which was available three years before the first IBM PC. HCL also pioneered remote infrastructure management with a contract for the National Stock Exchange.\nHCL offers a range of services, including IT and business services, engineering and R&D services, and products and platforms. HCL also has a presence in healthcare and talent management.',
            context: context,
            color: ColorUtils.blackColor,
            isSelectable: true),
      ],
    );
  }

  _buildRequirementsWidget(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headingH5(text: 'Job Description', context: context),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            headingH6(
                text: 'Required Experience:',
                context: context,
                color: ColorUtils.lightGrey),
            SizedBox(
              width: 10,
            ),
            headingH6(
                text: '3+ Years',
                context: context,
                color: ColorUtils.blackColor),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            headingH6(
                text: 'Location:',
                context: context,
                color: ColorUtils.lightGrey),
            SizedBox(
              width: 10,
            ),
            headingH6(
                text: 'Noida sector 66, 201301',
                context: context,
                color: ColorUtils.blackColor),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            headingH6(
                text: 'Sallary:',
                context: context,
                color: ColorUtils.lightGrey),
            SizedBox(
              width: 10,
            ),
            headingH6(
                text: '12 LPA', context: context, color: ColorUtils.blackColor),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            headingH6(
                text: 'Notice Period:',
                context: context,
                color: ColorUtils.lightGrey),
            SizedBox(
              width: 10,
            ),
            headingH6(
                text: 'Should be less than 30 days',
                context: context,
                color: ColorUtils.blackColor),
          ],
        )
      ],
    );
  }

  _buildCompanyNameAndLogoWidget(context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ImageUtils.getImage(
            image: ImageUtils.CompanyLogo, height: 50, width: 50),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headingH5(
                text: 'Senior Flutter Developer',
                context: context,
                color: ColorUtils.darkGray),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                headingH10(text: 'HCL Technlogies Ltd', context: context),
                SizedBox(
                  width: 10,
                ),
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
          ],
        ),
      ],
    );
  }
}
