import 'dart:convert';

import 'package:naukri_app/models/base_response.dart';
import 'package:naukri_app/services/web_services.dart';
import 'package:naukri_app/services/web_services_constant.dart';
import 'package:naukri_app/services/web_services_params.dart';

class AuthRepository {
  Future<BaseResponse>callLoginApi({required String email, required String password})async{
    Map<String,dynamic>body={
      WebServicesParams.emailId:email,
      WebServicesParams.password:password
    };
    String url=WebServicesConstant.BaseUrl+WebServicesConstant.LoginRouteUrl;
    return WebServices().postMethod(url: url, body: body);
  }
}