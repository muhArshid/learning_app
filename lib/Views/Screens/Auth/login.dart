import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:learning_app/Views/Screens/Auth/forget.dart';
import 'package:learning_app/Views/Screens/Home/home_screen.dart';
import 'package:learning_app/Views/widgets/button_icons_widgets.dart';
import 'package:learning_app/utils/AppColorCode.dart';
import 'package:learning_app/utils/AppFontOswald.dart';
import 'package:learning_app/utils/controllers.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColorCode.bgColor,
        body: ListView(
          children: [
            Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: AppColorCode.primaryTextHalf,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 34),
                    Text(
                      'Welcome Back',
                      style: AppFontMain(
                        color: AppColorCode.brandColor,
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 34),
                    Text(
                      'Enter your email to sing in to your account',
                      style: AppFontMain(
                        color: AppColorCode.primaryTextHalf,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 34),
                    buildtextFormLogin(
                      hintText: 'Email',
                      controller: userController.email,
                      label: 'Email',
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Enter Email ID';
                        }
                        if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val)) {
                          return 'Enter Valid Email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    buildtextFormLogin(
                      hintText: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                      controller: userController.password,
                      label: 'Password',
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Enter  Password';
                        }
                      },
                    ),
                    const SizedBox(height: 14),
                    InkWell(
                      onTap: () {
                        Get.to(() => ForgetScreen());
                      },
                      child: Text(
                        'Forget Password ?',
                        style: AppFontMain(
                          color: Colors.red[900],
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    isLoading
                        ? loadingButton(
                            label: ' '.tr,
                            height: size.height * 0.07,
                            width: size.width,
                            onTap: () {},
                          )
                        : button(
                            label: 'Sign In',
                            height: size.height * 0.07,
                            width: size.width * 0.60,
                            buttonColor: AppColorCode.brandColor,
                            onTap: () async {
                              // Get.to(() => HomeScreen());
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                                var flag = await userController.signIn();
                                if (!flag) {
                                  Fluttertoast.showToast(
                                      msg: 'please_check_credentials'.tr,
                                      backgroundColor: AppColorCode.brandColor);
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              }
                            },
                          ),
                    const SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        Get.to(() => LoginScreen());
                      },
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'By Clicking on "Sing In" You agree to our',
                              style: AppFontMain(
                                color: AppColorCode.primaryTextHalf,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Terms of use and privacy policy',
                              style: AppFontMain(
                                color: AppColorCode.primaryTextHalf,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
          ],
        ));
  }
}
