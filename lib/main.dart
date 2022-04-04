import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/Controller/app_controller.dart';
import 'package:learning_app/Controller/auth_controller.dart';
import 'package:learning_app/Controller/cart_controller.dart';
import 'package:learning_app/Controller/course_controller.dart';
import 'package:learning_app/Views/Screens/Auth/choose_auth.dart';
import 'package:learning_app/utils/AppColorCode.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(MainController());
  Get.put(CourseContoller());
  Get.put(UserController());
  Get.lazyPut(() => CartController());
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My app',
        theme: ThemeData.dark().copyWith(
          canvasColor: AppColorCode.backgroundColor,
        ),
        home: const AuthScreen(),
      );
    });
  }
}
