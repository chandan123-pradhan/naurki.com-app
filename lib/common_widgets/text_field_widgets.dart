import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naukri_app/utils/color_utils.dart';

class TextFieldWidgets {
  static Widget getTextField({
    required BuildContext context,
    required TextEditingController controller,
    required String title,
    bool obscureText = false, // Optional parameter for password fields
    String? Function(String?)? validator, // Optional validator
    Function(String)? onChanged,
    VoidCallback? onCompleteEditing, // Fixed this to VoidCallback
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      onEditingComplete: onCompleteEditing, // This should now work correctly
      
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        labelText: title,
        labelStyle: GoogleFonts.lato(
          textStyle: Theme.of(context).textTheme.displayLarge,
          fontSize: 14,
          color: ColorUtils.lightGrey,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic,
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
      ),
      validator: validator, // Attach the validator to the TextFormField
      onChanged: onChanged,
    );
  }
}
