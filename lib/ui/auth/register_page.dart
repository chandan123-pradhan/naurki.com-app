import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naukri_app/common_widgets/bottom_widget.dart';
import 'package:naukri_app/common_widgets/text_field_widgets.dart';
import 'package:naukri_app/common_widgets/text_widgets.dart';
import 'package:naukri_app/utils/color_utils.dart';
import 'package:naukri_app/utils/size_utils.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = new TextEditingController();
    TextEditingController _passwordController = new TextEditingController();
      TextEditingController _fullNameController = new TextEditingController();
    TextEditingController _mobileNumberController = new TextEditingController();
    return Scaffold(
      backgroundColor: ColorUtils.white,
      appBar: AppBar(
        leading: BottomWidget.getBackBottom(),
        backgroundColor: ColorUtils.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headingH4(context: context, text: 'Create your Naukri profile'),
                const SizedBox(
                  height: 5,
                ),
                headingH10(
                    context: context,
                    text: "Search & apply to jobs from india's No. 1 Job site"),
                const SizedBox(
                  height: 35,
                ),
                 _buildFullField(
                    controller: _fullNameController, context: context),
                const SizedBox(
                  height: 40,
                ),

                _buildEmailField(
                    controller: _emailController, context: context),
                  const SizedBox(
                  height: 5,
                ),

                headingH11(
                    context: context,
                    text: "We'll send relevant jobs and updates to this email"),
                const SizedBox(
                  height: 40,
                ),
                _buildPasswordField(
                    controller: _passwordController, context: context),
                    const SizedBox(
                  height: 5,
                ),

                headingH11(
                    context: context,
                    text: "This helps your account stay protected"),
                     const SizedBox(
                  height: 40,
                ),
                _buildMobileNumberField(
                    controller: _mobileNumberController, context: context),
                    const SizedBox(
                  height: 5,
                ),

                headingH11(
                    context: context,
                    text: "Recruiters will contact you on this number"),
               
                const SizedBox(
                  height: 60,
                ),
                BottomWidget.getMainBottom(context: context, title: 'Register',
                color: ColorUtils.red
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    headingH11(
                        context: context, text: "By clicking Register, you agree to the   "),
                    headingH11(
                        context: context,
                        text: "Terms & Conditions   ",
                        color: ColorUtils.primaryBlue),
                    headingH11(
                        context: context, text: "and    "),
                    headingH11(
                        context: context,
                        text: "Privacy Policy",
                        color: ColorUtils.primaryBlue),
                  ],

                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildFullField(
      {required TextEditingController controller,
      required BuildContext context}) {
    return TextFieldWidgets.getTextField(
        context: context, controller: controller, title: 'Full name*');
  }

  _buildEmailField(
      {required TextEditingController controller,
      required BuildContext context}) {
    return TextFieldWidgets.getTextField(
        context: context, controller: controller, title: 'Email ID*');
  }

  _buildPasswordField(
      {required TextEditingController controller,
      required BuildContext context}) {
    return TextFieldWidgets.getTextField(
        context: context, controller: controller, title: 'Create password* (Minimum 6 characters)');
  }
    _buildMobileNumberField(
      {required TextEditingController controller,
      required BuildContext context}) {
    return TextFieldWidgets.getTextField(
        context: context, controller: controller, title: 'Mobile Number*');
  }
  
}
