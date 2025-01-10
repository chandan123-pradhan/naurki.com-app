import 'package:naukri_app/services/api_state.dart';

class BaseResponse {
  RequestState status;
  String message;
  Map responseBody;
  BaseResponse({required this.status,required this.message,required this.responseBody});
}