import 'package:flutter/material.dart';
import 'package:naukri_app/common_widgets/bottom_widget.dart';
import 'package:naukri_app/common_widgets/text_field_widgets.dart';
import 'package:naukri_app/common_widgets/text_widgets.dart';
import 'package:naukri_app/module/auth/provider/auth_provider_controller.dart';
import 'package:naukri_app/utils/app_routes.dart';
import 'package:naukri_app/utils/color_utils.dart';
import 'package:naukri_app/utils/size_utils.dart';
import 'package:provider/provider.dart'; // Import Provider package

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Create TextEditingControllers for email and password
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    // GlobalKey for Form validation
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: ColorUtils.lightGray,
      appBar: AppBar(
        backgroundColor: ColorUtils.lightGray,
        elevation: 0,
        centerTitle: true,
        title: headingH4(context: context, text: 'Log in to Naukri'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                _buildEmailField(context, _emailController),
                const SizedBox(height: 40),
                _buildPasswordField(context, _passwordController),
                const SizedBox(height: 10),
                Container(
                  width: displayWeight(context) / 1,
                  alignment: Alignment.centerRight,
                  child: headingH10(
                    text: 'Forgot password',
                    context: context,
                    isHyperLink: true,
                  ),
                ),
                const SizedBox(height: 60),
                Consumer<AuthProviderController>(
                  builder: (context, authProvider, child) {
                    return BottomWidget.getMainBottom(
                      context: context,
                      title: 'Login',
                      onPressed: () => _validateAndLogin(
                        context, 
                        _formKey, 
                        _emailController.text, 
                        _passwordController.text, 
                        authProvider,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    headingH10(context: context, text: "Don't have an account?   "),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.regisePage);
                      },
                      child: headingH10(
                        context: context,
                        text: "Register for free",
                        color: ColorUtils.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildEmailField(BuildContext context, TextEditingController controller) {
    return TextFieldWidgets.getTextField(
      context: context,
      controller: controller,
      title: 'Enter email ID',
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
    );
  }

  _buildPasswordField(BuildContext context, TextEditingController controller) {
    return TextFieldWidgets.getTextField(
      context: context,
      controller: controller,
      title: 'Password',
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        } else if (value.length < 6) {
          return 'Password must be at least 6 characters long';
        }
        return null;
      },
    );
  }

  // Method to validate form and trigger login using AuthProvider
  _validateAndLogin(
      BuildContext context, 
      GlobalKey<FormState> formKey, 
      String email, 
      String password, 
      AuthProviderController authProvider) async {
    if (formKey.currentState?.validate() ?? false) {
      // Form validation passed, now proceed with login
      bool success = await authProvider.login(email, password);
      if (success) {
        Navigator.pushReplacementNamed(context, AppRoutes.dashboardPage);
        
      } else {
        // Show an error message
        
      }
    }
  }

}
