import 'dart:convert';
import 'package:learning_app/Models/auth_res.dart';
import 'package:learning_app/Service/api/main_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  static MainController instance = Get.find();
  String? fcmToken;
  String? _token;
  String? get token => _token;
  bool isFirstTime = true;
  bool get isAuth => _token != null;
  // Future<bool> tryAutoLogin() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   if (prefs.containsKey('first_time')) {
  //     print('is not first time');
  //     var value = prefs.getBool('first_time');
  //     isFirstTime = value!;
  //     print(isFirstTime);
  //     update();
  //   }
  //   if (!prefs.containsKey('token')) {
  //     return false;
  //   }

  //   final extractedUserData =
  //       json.decode(prefs.getString('token') ?? '') as Map<String, dynamic>;
  //   _token = extractedUserData['token'].toString();
  //   print('ss');
  //   update();
  //   return true;
  // }

  ////////////////////////// Auth APIs ///////////////////////////////

  Future<bool> loginUser(dynamic data) async {
    AuthResponse? responseModel = await GeneralAPI.loginUser(data);
    if (responseModel != null) {
      setToken(responseModel.data!.accessToken ?? '');
      return true;
    } else {
      return false;
    }
  }

  void setToken(String tk) async {
    print('setting token');
    _token = tk;
    final prefs = await SharedPreferences.getInstance();
    final storeData = jsonEncode({'token': _token});
    prefs.setString('token', storeData);
    print(isAuth);
    update();
  }

  void clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  /////////

}
