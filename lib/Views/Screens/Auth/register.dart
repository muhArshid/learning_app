import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/Views/Screens/Auth/login.dart';
import 'package:learning_app/Views/Screens/Home/home_screen.dart';
import 'package:learning_app/Views/Screens/Home/main_home_holder.dart';
import 'package:learning_app/Views/widgets/button_icons_widgets.dart';
import 'package:learning_app/utils/AppColorCode.dart';
import 'package:learning_app/utils/AppFontOswald.dart';
import 'package:learning_app/utils/controllers.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
                        'Sign up',
                        style: AppFontMain(
                          color: AppColorCode.brandColor,
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 34),
                      Text(
                        'By using our service you are agreeing to your ',
                        style: AppFontMain(
                          color: AppColorCode.primaryTextHalf,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Terms and Privacy Statement',
                        style: AppFontMain(
                          color: AppColorCode.primaryTextHalf,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 34),
                      buildtextFormLogin(
                        hintText: 'Name',
                        controller: userController.name,
                        label: 'Name',
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter  Name';
                          }
                        },
                      ),
                      const SizedBox(height: 24),
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
                        hintText: 'Country',
                        keyboardType: TextInputType.text,
                        controller: userController.country,
                        label: 'Country',
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter  Country';
                          }
                        },
                      ),
                      const SizedBox(height: 24),
                      buildtextFormLogin(
                        hintText: 'Phone',
                        keyboardType: TextInputType.number,
                        controller: userController.phone,
                        label: 'Phone',
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter  Password';
                          }
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
                      Text(
                        'Forget Password ?',
                        style: AppFontMain(
                          color: Colors.red[900],
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 25),
                      isLoading
                          ? loadingButton(
                              label: ' ',
                              height: size.height * 0.07,
                              width: size.width * 0.60,
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
                                  // create();
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    var isScuccess =
                                        await userController.signUp();
                                    if (!isScuccess) {
                                      Get.offAll(() => MainHomeHolder(
                                            currentIndex: 1,
                                          ));
                                      setState(() {
                                        isLoading = true;
                                      });
                                    }
                                  }
                                }
                              }),
                      const SizedBox(height: 30),
                      InkWell(
                        onTap: () {
                          Get.to(() => LoginScreen());
                        },
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Have an account ? ',
                                style: AppFontMain(
                                  color: AppColorCode.primaryTextHalf,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Sign in',
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
                      const SizedBox(height: 30),
                    ]),
              ),
            ],
          )),
    );
  }
}
