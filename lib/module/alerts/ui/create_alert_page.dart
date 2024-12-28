import 'package:flutter/material.dart';
import 'package:naukri_app/common_widgets/bottom_widget.dart';
import 'package:naukri_app/common_widgets/confirmation_poup.dart';
import 'package:naukri_app/common_widgets/text_field_widgets.dart';
import 'package:naukri_app/common_widgets/text_widgets.dart';
import 'package:naukri_app/module/auth/provider/auth_provider_controller.dart';
import 'package:naukri_app/utils/app_routes.dart';
import 'package:naukri_app/utils/color_utils.dart';
import 'package:naukri_app/utils/size_utils.dart';
import 'package:provider/provider.dart'; // Import Provider package

class CreateAlertPage extends StatelessWidget {
  const CreateAlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Create TextEditingControllers for email and password
    TextEditingController _jobTitleController = TextEditingController();
    TextEditingController _locationController = TextEditingController();
    TextEditingController _skillController = TextEditingController();

    // GlobalKey for Form validation
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: ColorUtils.lightGray,
      appBar: AppBar(
        backgroundColor: ColorUtils.lightGray,
        elevation: 0,
        centerTitle: true,
        title: headingH4(context: context, text: 'Create Alert'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                _buildEmailField(context, _jobTitleController),
                const SizedBox(height: 40),
                _buildPasswordField(context, _locationController),
               const SizedBox(height: 40),
                _buildSkill(context, _skillController),
             
                const SizedBox(height: 60),
               BottomWidget.getMainBottom(
                      context: context,
                      title: 'Submit',
                      onPressed: (){
_showConfirmationPopup(context);
                      }
                    ),
              
              ],
            ),
          ),
        ),
      ),
    );
  }


  _showConfirmationPopup(context){
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      
      context: context, builder: (context){
      return AlertCreateConfirmationPopup();
    });
  }

  _buildEmailField(BuildContext context, TextEditingController controller) {
    return TextFieldWidgets.getTextField(
      context: context,
      controller: controller,
      title: 'Job title',
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        return null;
      },
    );
  }

  _buildPasswordField(BuildContext context, TextEditingController controller) {
    return TextFieldWidgets.getTextField(
      context: context,
      controller: controller,
      title: 'Location',
      obscureText: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter location';
        }
        return null;
      },
    );
  }

  
    _buildSkill(BuildContext context, TextEditingController controller) {
    return TextFieldWidgets.getTextField(
      context: context,
      controller: controller,
      title: 'Skills',
      obscureText: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter skills';
        }
        return null;
      },
    );
  }

}
