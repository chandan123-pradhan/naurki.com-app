import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naukri_app/common_widgets/bottom_widget.dart';
import 'package:naukri_app/common_widgets/text_field_widgets.dart';
import 'package:naukri_app/common_widgets/text_widgets.dart';
import 'package:naukri_app/utils/app_routes.dart';
import 'package:naukri_app/utils/color_utils.dart';
import 'package:naukri_app/utils/size_utils.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = new TextEditingController();
    TextEditingController _passwordController = new TextEditingController();
    return Scaffold(
      backgroundColor: ColorUtils.white,
      appBar: AppBar(
        backgroundColor: ColorUtils.white,
        elevation: 0,
        centerTitle: true,
        title: headingH4(context: context, text: 'Log in to Naukri'),
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                 const SizedBox(height: 20,),
                _buildEmailField(controller: _emailController, context: context),
                const SizedBox(height: 40,),
                 _buildPasswordField(controller: _passwordController, context: context),
                 const SizedBox(height: 10,),
                Container(
                  width: displayWeight(context)/1,
                  alignment: Alignment.centerRight,
                  child: headingH10(text: 'Forgot password', context: context,
                  isHyperLink: true
                  ),
                ),
                const SizedBox(height: 60,),
                BottomWidget.getMainBottom(context: context, title: 'Login'),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    headingH10(context: context,text: "Don't have an account?   "),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, AppRoutes.regisePage);
                      },
                      child: headingH10(context: context,text: "Register for free",
                      color: ColorUtils.red
                      
                      
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildEmailField(
      {required TextEditingController controller,
      required BuildContext context}) {
    return TextFieldWidgets.getTextField(context: context, controller: controller, title: 'Enter email ID');
  }

   _buildPasswordField(
      {required TextEditingController controller,
      required BuildContext context}) {
    return TextFieldWidgets.getTextField(context: context, controller: controller, title: 'Password');
  }
}
