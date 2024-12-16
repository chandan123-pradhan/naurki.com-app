import 'package:flutter/material.dart';
import 'package:naukri_app/common_widgets/bottom_widget.dart';
import 'package:naukri_app/common_widgets/text_field_widgets.dart';
import 'package:naukri_app/common_widgets/text_widgets.dart';
import 'package:naukri_app/module/auth/provider/auth_provider_controller.dart';
import 'package:naukri_app/utils/app_routes.dart';
import 'package:naukri_app/utils/color_utils.dart';
import 'package:naukri_app/utils/size_utils.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Controllers for each text field
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _fullNameController = TextEditingController();
    TextEditingController _mobileNumberController = TextEditingController();
    TextEditingController _highestQualificationController = TextEditingController();

    // Form key to validate the form fields
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: ColorUtils.white,
      appBar: AppBar(
        leading: BottomWidget.getBackBottom(
          onPressed: (){
            Navigator.pop(context);
          }
        ),
        backgroundColor: ColorUtils.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey, // Attach the form key to Form widget
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headingH4(context: context, text: 'Create your Naukri profile'),
                const SizedBox(height: 5),
                headingH10(
                    context: context,
                    text: "Search & apply to jobs from india's No. 1 Job site"),
                const SizedBox(height: 35),
                
                // Full Name Field
                _buildFullField(
                  controller: _fullNameController, context: context),
                const SizedBox(height: 40),

                // Email Field with validation
                _buildEmailField(
                  controller: _emailController, context: context),
                const SizedBox(height: 5),
                headingH11(
                  context: context,
                  text: "We'll send relevant jobs and updates to this email"),
                  const SizedBox(height: 40),

                // Highest Qualification Field with validation
                _buildHighestQualificationField(
                  controller: _highestQualificationController, context: context),
                const SizedBox(height: 40),

                // Password Field with validation
                _buildPasswordField(
                  controller: _passwordController, context: context),
                const SizedBox(height: 5),
                headingH11(
                  context: context,
                  text: "This helps your account stay protected"),
                const SizedBox(height: 40),

                // Mobile Number Field with validation
                _buildMobileNumberField(
                  controller: _mobileNumberController, context: context),
                const SizedBox(height: 5),
                headingH11(
                  context: context,
                  text: "Recruiters will contact you on this number"),
                
                const SizedBox(height: 60),

                // Register Button
                BottomWidget.getMainBottom(
                  context: context,
                  title: 'Register',
                  color: ColorUtils.red,
                  onPressed: () {
                    _validateAndRegister(
                      context,
                      _formKey, // Form key for validation
                      _fullNameController.text,
                      _emailController.text,
                      _passwordController.text,
                      _mobileNumberController.text,
                      _highestQualificationController.text,
                    );
                  },
                ),
                const SizedBox(height: 20),

                // Terms and conditions
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Full Name Field with validation
  _buildFullField(
      {required TextEditingController controller,
      required BuildContext context}) {
    return TextFieldWidgets.getTextField(
      context: context,
      controller: controller,
      title: 'Full name*',
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Full name is required';
        }
        return null; // No error
      },
    );
  }

  // Email Field with validation
  _buildEmailField(
      {required TextEditingController controller,
      required BuildContext context}) {
    return TextFieldWidgets.getTextField(
      context: context,
      controller: controller,
      title: 'Email ID*',
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email is required';
        } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null; // No error
      },
    );
  }

  // Password Field with validation
  _buildPasswordField(
      {required TextEditingController controller,
      required BuildContext context}) {
    return TextFieldWidgets.getTextField(
      context: context,
      controller: controller,
      title: 'Create password* (Minimum 6 characters)',
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
        } else if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null; // No error
      },
    );
  }

  // Mobile Number Field with validation
  _buildMobileNumberField(
      {required TextEditingController controller,
      required BuildContext context}) {
    return TextFieldWidgets.getTextField(
      context: context,
      controller: controller,
      title: 'Mobile Number*',
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Mobile number is required';
        } else if (value.length != 10) {
          return 'Please enter a valid 10-digit mobile number';
        }
        return null; // No error
      },
    );
  }

  // Highest Qualification Field with validation
  _buildHighestQualificationField(
      {required TextEditingController controller,
      required BuildContext context}) {
    return TextFieldWidgets.getTextField(
      context: context,
      controller: controller,
      title: 'Highest Qualification*',
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Highest Qualification is required';
        }
        return null; // No error
      },
    );
  }

  // Method to validate form and trigger registration using AuthProvider
  _validateAndRegister(
    BuildContext context,
    GlobalKey<FormState> formKey,
    String fullName,
    String email,
    String password,
    String mobileNumber,
    String highestQualification,
  ) async {
    // Validate the form
    if (formKey.currentState?.validate() ?? false) {
      // Form validation passed, now proceed with registration
      bool success = true; //call method here......

      if (success) {
        // If registration is successful, navigate to the next screen
        Navigator.pushReplacementNamed(context, AppRoutes.completeProfilePage); // Example route
      } else {
        // Show an error message if registration fails
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Registration failed. Please try again."))
        );
      }
    }
  }
}
