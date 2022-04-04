import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:learning_app/Controller/app_controller.dart';
import 'package:learning_app/Models/error_response_model.dart';
import 'package:learning_app/Views/widgets/dialog.dart';
import 'HttpConstants.dart';

class HttpRequestHandler {
  String requestType = 'POST';
  late Map<String, dynamic> responsebody;
  ErrorResponse? error;

  Future<bool> sendTokenServerRequest(
      String urlExtension, String bodyData) async {
    MainController controller = Get.find();
    var token = controller.token;
    print(token);
    print(urlExtension);
    print(bodyData);
    var isScuccess;
    // var response = await http.post(
    //     Uri.https(HttpConstants.baseUrl, urlExtension),
    // var response = await http.post(Uri.parse(urlExtension),
    //     body: jsonEncode(bodyData),
    //     headers: token == null
    //         ? {}
    //         : {
    //             "Accept": "application/json",
    //             "content-type": "application/json",
    //             "Authorization": "Bearer " + token
    //           });
    // //print('response code');

    //  var uri = Uri.http(HttpConstants.baseUrl, urlExtension, queryParameters);
    // var response = await http.get(
    //   Uri.parse(urlExtension),
    //   //body: jsonEncode(bodyData),
    // );

    final response = await http.get(
      Uri.parse(urlExtension + bodyData),
      headers: token == null
          ? {"Content-type": "application/json"}
          : {
              "Accept": "application/json",
              "content-type": "application/json",
              "Authorization": "Bearer " + token
            },

      // body: queryParameters,

      // body: json.encode(bodyData),
    );
    print(response.body);
    print(response.statusCode);
    print(response.body);
    if (response.body.isNotEmpty) {
      var resData = jsonDecode(response.body) as Map<String, dynamic>;
      responsebody = resData;
    }
    if (response.statusCode == 200 || response.statusCode == 204) {
      isScuccess = true;
    } else if (response.statusCode == 400) {
      if (responsebody.containsKey('responseMessage')) {
        print(response.body);
        error = ErrorResponse.fromJson(responsebody);
        print(error?.responseMessage);
        if (error?.responseMessage != null && responsebody.isEmpty) {
          Get.dialog(errorDialog(error?.responseMessage ?? ''));
        } else {
          Get.dialog(
              errorDialog(error?.responseMessage ?? 'Something went wrong'));
        }
      }
      isScuccess = false;
    } else {
      isScuccess = false;
      Get.dialog(errorDialog('Something went wrong'));
    }
    return isScuccess;
  }
}
