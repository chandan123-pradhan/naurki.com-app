import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naukri_app/module/auth/provider/auth_provider_controller.dart';
import 'package:naukri_app/utils/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:naukri_app/common_widgets/bottom_widget.dart';
import 'package:naukri_app/common_widgets/text_field_widgets.dart';
import 'package:naukri_app/common_widgets/text_widgets.dart';
import 'package:naukri_app/utils/color_utils.dart';
import 'package:naukri_app/utils/size_utils.dart';
import 'package:intl/intl.dart'; // For date formatting

class CompleteProfilePage extends StatelessWidget {
  const CompleteProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.white,
      appBar: AppBar(
        leading: BottomWidget.getBackBottom(onPressed: () {
          Navigator.pop(context);
        }),
        backgroundColor: ColorUtils.white,
        elevation: 0,
        centerTitle: true,
        actions: [
         Padding(
           padding: const EdgeInsets.only(right:25.0),
           child: BottomWidget.getTextBottom(title: 'Skip', context: context,
           onPressed: (){
           Navigator.pushReplacementNamed(context, AppRoutes.dashboardPage);
           }
           ),
         ),


        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Consumer<AuthProviderController>(
          builder: (context, authProvider, child) {
            // Ensure there's at least one employment detail in the list
            if (authProvider.employmentDetails.isEmpty) {
              authProvider.addEmploymentDetail(); // Default first set of fields
            }

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headingH4(
                      context: context, text: 'Add Your Employment Details'),
                  const SizedBox(height: 5),
                  headingH10(
                      context: context,
                      text:
                          "Search & apply to jobs from India's No. 1 Job site"),
                  const SizedBox(height: 35),

                  // Display the dynamic fields
                  ...List.generate(authProvider.employmentDetails.length,
                      (index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            headingH10(
                                context: context, text: "Employment Details"),
                            if (authProvider.employmentDetails.length > 1)
                              IconButton(
                                icon: Icon(Icons.remove_circle,
                                    color: ColorUtils.red),
                                onPressed: () {
                                  // Remove the specific field set
                                  authProvider.removeEmploymentDetail(index);
                                },
                              ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        _buildEmployerNameField(
                          controller: TextEditingController(
                              text: authProvider.employmentDetails[index]
                                  ['employerName']),
                          context: context,
                          
                          index: index,
                        ),
                        const SizedBox(height: 5),
                        headingH11(
                            context: context,
                            text:
                                "Enter Employer Name where you have worked previously"),
                        const SizedBox(height: 20),
                        _buildLocationField(
                          controller: TextEditingController(
                              text: authProvider.employmentDetails[index]
                                  ['location']),
                          context: context,
                          index: index,
                        ),
                        const SizedBox(height: 20),
                        _buildDesignationField(
                          controller: TextEditingController(
                              text: authProvider.employmentDetails[index]
                                  ['designation']),
                          context: context,
                          index: index,
                        ),
                        const SizedBox(height: 20),

                        // From Date Picker
                        _buildFromDateField(
                          context: context,
                          index: index,
                          initialDate: authProvider.employmentDetails[index]
                              ['fromDate'],
                        ),
                        const SizedBox(height: 20),

                        // To Date Picker
                        _buildToDateField(
                          context: context,
                          index: index,
                          initialDate: authProvider.employmentDetails[index]
                              ['toDate'],
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  }),

                  // Add more field set button
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      width: displayWeight(context) / 1,
                      alignment: Alignment.centerRight,
                      child: BottomWidget.getTextBottom(
                        context: context,
                        title: 'Add More',
                        onPressed: () {
                          authProvider.addEmploymentDetail();
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  BottomWidget.getMainBottom(
                    context: context,
                    title: 'Submit',
                    color: ColorUtils.red,
                    onPressed: () {
                       Navigator.pushReplacementNamed(context, AppRoutes.dashboardPage);
                      // Handle submit logic here
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // Employer Name TextField
  _buildEmployerNameField({
    required TextEditingController controller,
    required BuildContext context,
    required int index,
  }) {
    return TextFieldWidgets.getTextField(
      onCompleteEditing: (){
         context.read<AuthProviderController>().updateField(index, 'employerName', controller.text);
      },
      context: context,
      controller: controller,
      title: 'Employer Name*',
      onChanged: (value) {
       
      },
    );
  }

  // Location TextField
  _buildLocationField({
    required TextEditingController controller,
    required BuildContext context,
    required int index,
  }) {
    return TextFieldWidgets.getTextField(
      context: context,
      controller: controller,
      title: 'Location*',
        onCompleteEditing: (){
         context.read<AuthProviderController>().updateField(index, 'location', controller.text);
      },
      onChanged: (value) {
       
      },
    );
  }

  // Designation TextField
  _buildDesignationField({
    required TextEditingController controller,
    required BuildContext context,
    required int index,
  }) {
    return TextFieldWidgets.getTextField(
      context: context,
      controller: controller,
      title: 'Designation*',
        onCompleteEditing: (){
         context.read<AuthProviderController>().updateField(index, 'designation', controller.text);
      },
      onChanged: (value) {
       
      },
    );
  }

  // From Date Picker
  _buildFromDateField({
    required BuildContext context,
    required int index,
    required String? initialDate,
  }) {
    TextEditingController controller = TextEditingController(text: initialDate);
    return GestureDetector(
      onTap: () async {
        DateTime? selectedDate = await _selectDate(context);
        if (selectedDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
          controller.text = formattedDate;
          context
              .read<AuthProviderController>()
              .updateFromDate(index, formattedDate);
        }
      },
      child: AbsorbPointer(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            labelText: 'From Date*',
            labelStyle: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 14,
              color: ColorUtils.lightGrey,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
            suffixIcon: Icon(Icons.calendar_today, size: 15),
          ),
        ),
      ),
    );
  }

  // To Date Picker
  _buildToDateField({
    required BuildContext context,
    required int index,
    required String? initialDate,
  }) {
    TextEditingController controller = TextEditingController(text: initialDate);
    return GestureDetector(
      onTap: () async {
        DateTime? selectedDate = await _selectDate(context);
        if (selectedDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
          controller.text = formattedDate;
          context
              .read<AuthProviderController>()
              .updateToDate(index, formattedDate);
        }
      },
      child: AbsorbPointer(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            labelText: 'To Date*',
            labelStyle: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 14,
              color: ColorUtils.lightGrey,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
            suffixIcon: Icon(
              Icons.calendar_today,
              size: 15,
            ),
          ),
        ),
      ),
    );
  }

  // Date Picker Dialog
  Future<DateTime?> _selectDate(BuildContext context) async {
    DateTime initialDate = DateTime.now();
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    return selectedDate;
  }
}
