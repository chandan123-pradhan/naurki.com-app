import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:naukri_app/models/base_response.dart';
import 'package:http/http.dart' as http;
import 'package:naukri_app/services/api_state.dart';

class WebServices {
  // Logger setup with a PrettyPrinter for better readability
  var logger = Logger(
    printer: PrettyPrinter(
      noBoxingByDefault: true,
      methodCount: 2, // Number of method calls to be displayed
      errorMethodCount: 8, // Number of method calls if stacktrace is provided
      lineLength: 120, // Width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart, // Time-based log output
    ),
  );

  // Method to perform a GET request
  Future<BaseResponse> getMethod({
    required String url,
    String authToken = '',
  }) async {
    http.Response response;
    
    // Set up the headers with optional Authorization if provided
    var headers = <String, String>{};
    if (authToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $authToken';
    }

    // Log request details
    if (authToken.isNotEmpty) {
      logger.i('🔵 Calling GET Method - URL: $url, Headers: $headers');
    } else {
      logger.i('🔵 Calling GET Method - URL: $url, No Authorization Token');
    }

    try {
      // Make the GET request
      response = await http.get(
        Uri.parse(url),
        headers: headers.isNotEmpty ? headers : null,
      );

      // Handle API response
      return _handleApiResponse(response: response, url: url);
    } catch (e) {
      // Catch any exceptions during the request
      logger.e('❌ Error during GET request to $url', error: e);
      return BaseResponse(
        status: RequestState.failed,
        message: 'An error occurred while making the request.',
        responseBody: {},
      );
    }
  }

  // POST Method
  Future<BaseResponse> postMethod({
    required String url,
    required Map<String, dynamic> body,
    String authToken = '',
  }) async {
    http.Response response;

    // Set up the headers with optional Authorization if provided
    var headers = <String, String>{
      'Content-Type': 'application/json', // Ensuring JSON content type for POST
    };
    if (authToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $authToken';
    }

    // Log request details
    if (authToken.isNotEmpty) {
      logger.i('🟢 Calling POST Method - URL: $url, Headers: $headers, Body: $body');
    } else {
      logger.i('🟢 Calling POST Method - URL: $url, No Authorization Token, Body: $body');
    }

    try {
      // Make the POST request
      response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body), // Encoding the body as JSON
      );

      // Handle API response
      return _handleApiResponse(response: response, url: url);
    } catch (e) {
      // Catch any exceptions during the request
      logger.e('❌ Error during POST request to $url', error: e);
      return BaseResponse(
        status: RequestState.failed,
        message: 'An error occurred while making the request.',
        responseBody: {},
      );
    }
  }

  // Handle the API response and map it to the BaseResponse
  BaseResponse _handleApiResponse({
    required http.Response response,
    required String url,
  }) {
    try {
      // Decode the response body only if the status code is valid
      var responseBody = json.decode(response.body);
      
      // Handle different HTTP status codes
      switch (response.statusCode) {
        case 200:
        case 201:
          // Success Response
          logger.d('✅ Success response from $url, Response: $responseBody');
          return BaseResponse(
            status: RequestState.success,
            message: 'Operation successfully done.',
            responseBody: responseBody,
          );
        case 400:
          // Bad Request
          logger.w('❌ Bad Request to $url, Response: $responseBody');
          return BaseResponse(
            status: RequestState.badRequest,
            message: 'Bad request. Please check your input data.',
            responseBody: responseBody,
          );
        case 401:
          // Unauthorized (Authentication failure)
          logger.w('❌ Unauthorized access to $url, Response: $responseBody');
          return BaseResponse(
            status: RequestState.unautherized,
            message: 'Unauthorized. Please login to continue.',
            responseBody: {},
          );
        case 404:
          // Not Found (API endpoint or resource does not exist)
          logger.w('❌ API not found at $url, Response: $responseBody');
          return BaseResponse(
            status: RequestState.notFound,
            message: 'API not found. Please check the endpoint.',
            responseBody: {},
          );
        default:
          // Other failure scenarios
          logger.e('❌ Unexpected error with status code ${response.statusCode} from $url, Response: $responseBody');
          return BaseResponse(
            status: RequestState.failed,
            message: 'Unexpected error. Please try again later.',
            responseBody: responseBody,
          );
      }
    } catch (e) {
      // Handle JSON parsing errors or other unexpected issues
      logger.e('❌ Error parsing response from $url', error: e);
      return BaseResponse(
        status: RequestState.failed,
        message: 'Error parsing response. Invalid JSON format.',
        responseBody: {},
      );
    }
  }
}
