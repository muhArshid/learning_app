import 'package:get/get.dart';
import 'package:learning_app/Models/auth_res.dart';
import 'package:learning_app/Models/course_res.dart';
import 'package:learning_app/Models/home_res.dart';
import 'package:learning_app/Service/network/HttpConstants.dart';
import 'package:learning_app/Service/network/HttpRequestHandler.dart';

class GeneralAPI {
  static Future<AuthResponse?> loginUser(dynamic request) async {
    try {
      AuthResponse? loginResponse;
      HttpRequestHandler requestHandler = HttpRequestHandler();

      var isSuccess = await requestHandler.sendTokenServerRequest(
          HttpConstants.getcourse, request);
      var resBody = requestHandler.responsebody;

      if (isSuccess) {
        loginResponse = AuthResponse.fromJson(resBody);
      }
      return loginResponse;
    } catch (e) {
      throw e;
    }
  }

  static Future<HomeDetails?> getCourse() async {
    try {
      HomeDetails? qusAnsResponse;
      HttpRequestHandler requestHandler = HttpRequestHandler();

      var isSuccess = await requestHandler.sendTokenServerRequest(
          HttpConstants.getcourse, '');
      var resBody = requestHandler.responsebody;

      if (isSuccess) {
        qusAnsResponse = HomeDetails.fromJson(resBody);
      }
      return qusAnsResponse;
    } catch (e) {
      throw e;
    }
  }

  static Future<CourseDetails?> getCourseDetails(String data) async {
    try {
      CourseDetails? qusAnsResponse;
      HttpRequestHandler requestHandler = HttpRequestHandler();

      var isSuccess = await requestHandler.sendTokenServerRequest(
          HttpConstants.getcourseDetails, data);
      var resBody = requestHandler.responsebody;

      if (isSuccess) {
        qusAnsResponse = CourseDetails.fromJson(resBody);
      }
      return qusAnsResponse;
    } catch (e) {
      throw e;
    }
  }
}
