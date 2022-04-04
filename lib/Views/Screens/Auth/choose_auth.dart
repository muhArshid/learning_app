import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/Views/Screens/Auth/login.dart';
import 'package:learning_app/Views/Screens/Auth/register.dart';
import 'package:learning_app/Views/widgets/button_icons_widgets.dart';
import 'package:learning_app/utils/AppColorCode.dart';
import 'package:learning_app/utils/AppFontOswald.dart';
import 'package:learning_app/utils/AssetConstants.dart';
import 'package:learning_app/utils/controllers.dart';
import 'package:sizer/sizer.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColorCode.bgColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: ListView(
              children: [
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.to(() => LoginScreen());
                        },
                        child: Icon(
                          Icons.close,
                          color: AppColorCode.primaryTextHalf,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Center(
                  child: Text(
                    'Sing in',
                    style: AppFontMain(
                      color: AppColorCode.brandColor,
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Center(
                  child: Text(
                    "By Using our services you are agreeing to your",
                    style: AppFontMain(
                      color: AppColorCode.primaryTextHalf,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 1.h),
                Center(
                  child: Text(
                    "Terms and Privacy Statement",
                    style: AppFontMain(
                      color: AppColorCode.primaryTextHalf,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                authbutton(
                    label: 'Sign In Email',
                    height: size.height * 0.07,
                    width: size.width * 0.60,
                    iconName: AssetConstant.email,
                    onTap: () async {
                      Get.to(() => LoginScreen());
                    }),
                authbutton(
                    label: 'Sign In Google',
                    height: size.height * 0.07,
                    width: size.width * 0.60,
                    iconName: AssetConstant.google,
                    onTap: () async {
                      userController.signInWithGoogle();
                    }),
                authbutton(
                    //https://fstore-4757c.firebaseapp.com/__/auth/handler
                    label: 'Sign In Facebook',
                    height: size.height * 0.07,
                    width: size.width * 0.60,
                    iconName: AssetConstant.facebook,
                    onTap: () async {
                      userController.checkIfisLoggedIn();
                      //  Get.to(() => RegisterScreen());
                    }),
                SizedBox(height: 3.h),
                const SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    Get.to(() => RegisterScreen());
                  },
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'New Here? ',
                          style: AppFontMain(
                            color: AppColorCode.primaryTextHalf,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Singn Up',
                          style: AppFontMain(
                            color: AppColorCode.brandColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
