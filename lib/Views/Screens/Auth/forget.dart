import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/Views/Screens/Home/home_screen.dart';
import 'package:learning_app/Views/Screens/Home/main_home_holder.dart';
import 'package:learning_app/Views/widgets/button_icons_widgets.dart';
import 'package:learning_app/utils/AppColorCode.dart';
import 'package:learning_app/utils/AppFontOswald.dart';
import 'package:learning_app/utils/controllers.dart';
import 'package:otp_text_field/style.dart';
import 'package:sizer/sizer.dart';
import 'package:email_auth/email_auth.dart';
import 'package:otp_text_field/otp_text_field.dart';

class ForgetScreen extends StatefulWidget {
  ForgetScreen({Key? key}) : super(key: key);

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  EmailAuth emailAuth = new EmailAuth(sessionName: "Sample session");
  final _formEmailKey = GlobalKey<FormState>();
  final _formpasswordKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool emailtext = true;
  bool passwordtext = false;
  bool otpMode = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColorCode.bgColor,
        body: ListView(
          children: [
            SizedBox(height: 5.h),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
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
            if (emailtext)
              Form(
                key: _formEmailKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 5.h),
                      const SizedBox(height: 34),
                      Text(
                        'Forgot Password',
                        style: AppFontMain(
                          color: AppColorCode.brandColor,
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 34),
                      Text(
                        'Enter your email address assoiciated with',
                        style: AppFontMain(
                          color: AppColorCode.primaryTextHalf,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        ' your account.We will Email you a',
                        style: AppFontMain(
                          color: AppColorCode.primaryTextHalf,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'verification',
                        style: AppFontMain(
                          color: AppColorCode.primaryTextHalf,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 34),
                      buildtextFormLogin(
                        hintText: 'Email',
                        controller: emailController,
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
                      const SizedBox(height: 25),
                      button(
                          label: 'Sent',
                          height: size.height * 0.07,
                          width: size.width * 0.60,
                          buttonColor: AppColorCode.brandColor,
                          onTap: () async {
                            if (_formEmailKey.currentState!.validate()) {
                              var status = await userController.sendOtp();
                              if (status) {
                                setState(() {
                                  emailtext = false;
                                  otpMode = true;
                                });
                              }
                            }
                          }),
                      const SizedBox(height: 30),
                    ]),
              ),
            if (passwordtext)
              Form(
                key: _formpasswordKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [],
                      ),
                      const SizedBox(height: 34),
                      Text(
                        'Forgot Password',
                        style: AppFontMain(
                          color: AppColorCode.brandColor,
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 34),
                      buildtextFormLogin(
                        hintText: 'Current Password',
                        controller: emailController,
                        label: 'Password',
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter Current Password';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 25),
                      buildtextFormLogin(
                        hintText: 'New Password',
                        controller: emailController,
                        label: 'Password',
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter New Password';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 25),
                      buildtextFormLogin(
                        hintText: 'Confrim New Password',
                        controller: emailController,
                        label: 'Password',
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter Confrim New Password';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 25),
                      button(
                          label: 'Submit',
                          height: size.height * 0.07,
                          width: size.width * 0.60,
                          buttonColor: AppColorCode.brandColor,
                          onTap: () async {
                            Get.to(() => MainHomeHolder());
                            //   if (_formKey.currentState!.validate()) {
                            setState(() {});

                            // }
                          }),
                      const SizedBox(height: 30),
                    ]),
              ),
            if (otpMode)
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 34),
                  Text(
                    'Verification',
                    style: AppFontMain(
                      color: AppColorCode.brandColor,
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Enter your ',
                        style: AppFontMain(
                          color: AppColorCode.primaryTextHalf,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Verification Code',
                        style: AppFontMain(
                          color: AppColorCode.primaryTextHalf,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'We just sent you ',
                        style: AppFontMain(
                          color: AppColorCode.primaryTextHalf,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'on your  email address',
                    style: AppFontMain(
                      color: AppColorCode.primaryTextHalf,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Center(
                    child: OTPTextField(
                        controller: userController.otpController,
                        length: 4,
                        width: MediaQuery.of(context).size.width,
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldWidth: 55,
                        fieldStyle: FieldStyle.box,
                        outlineBorderRadius: 15,
                        style: TextStyle(
                            fontSize: 17, color: AppColorCode.brandColor),
                        onChanged: (pin) {
                          print("Changed: " + pin);
                        },
                        onCompleted: (pin) {
                          print("Completed: " + pin);
                        }),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't reseive a code? ",
                        style: AppFontMain(
                          color: AppColorCode.primaryTextHalf,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Resend Code',
                        style: AppFontMain(
                          color: AppColorCode.brandColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  button(
                      label: 'Sent',
                      height: size.height * 0.07,
                      width: size.width * 0.60,
                      buttonColor: AppColorCode.brandColor,
                      onTap: () async {
                        var flag = userController.verify();
                        if (flag) {
                          setState(() {
                            passwordtext = true;
                            otpMode = false;
                          });
                        }

                        // }
                      }),
                ],
              ),
          ],
        ));
  }
}
