import 'package:flutter/material.dart';

class AuthProviderController extends ChangeNotifier {
  // State variable to track the employment details
  List<Map<String, String>> employmentDetails = [
    {
      'employerName': '',
      'location': '',
      'designation': '',
      'fromDate': '',
      'toDate': '',
    },
  ];

  // Login function (no changes here)
  Future<bool> login(String email, String password) async {
    // Simulate a login process (you can replace this with your API logic)
   

    if (email == "test@gmail.com" && password == "123456") {
      return true;  // Successful login
    } else {
      return false;  // Failed login
    }
  }

  // Add a new employment detail entry
  void addEmploymentDetail() {
    employmentDetails.add({
      'employerName': '',
      'location': '',
      'designation': '',
      'fromDate': '',
      'toDate': '',
    });
    notifyListeners();
  }

  // Remove a set of employment details at a particular index
  void removeEmploymentDetail(int index) {
    employmentDetails.removeAt(index);
    notifyListeners();
  }

  // Update any field of a particular employment detail
  void updateField(int index, String field, String value) {
    employmentDetails[index][field] = value;
    notifyListeners();
  }

  // Optionally, we could provide specific methods for updating dates, but the general updateField can handle this.
  // For example, you can use these to update the From Date and To Date directly.
  void updateFromDate(int index, String date) {
    employmentDetails[index]['fromDate'] = date;
    notifyListeners();
  }

  void updateToDate(int index, String date) {
    employmentDetails[index]['toDate'] = date;
    notifyListeners();
  }

  // Function to validate the dates
  bool isValidDateRange(int index) {
    String fromDate = employmentDetails[index]['fromDate'] ?? '';
    String toDate = employmentDetails[index]['toDate'] ?? '';
    if (fromDate.isNotEmpty && toDate.isNotEmpty) {
      DateTime from = DateTime.parse(fromDate);
      DateTime to = DateTime.parse(toDate);
      return to.isAfter(from); // Ensure toDate is after fromDate
    }
    return true;
  }
}
