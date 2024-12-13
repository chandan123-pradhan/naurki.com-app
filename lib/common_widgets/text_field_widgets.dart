import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naukri_app/utils/color_utils.dart';

class TextFieldWidgets {
 static getTextField({required BuildContext context,required TextEditingController controller,required String title}){
    return TextField(
        controller: controller,
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
        ));
  }
}