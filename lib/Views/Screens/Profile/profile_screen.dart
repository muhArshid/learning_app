import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_app/Controller/auth_controller.dart';
import 'package:learning_app/Views/widgets/dialog.dart';
import 'package:learning_app/utils/AppColorCode.dart';
import 'package:learning_app/utils/AppFontOswald.dart';
import 'package:learning_app/utils/controllers.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey _menuKey = new GlobalKey();
  String? fileName;
  bool isloading = false;
  bool isEdit = false;
  bool isNameEdit = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (ct) {
      return Scaffold(
          body: ListView(
        children: [
          Container(
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: AppColorCode.pureWhite,
                    ),
                    height: 30.h,
                    width: 100.w,
                    decoration: BoxDecoration(color: AppColorCode.brandColor),
                  ),
                ),
                Positioned(
                    right: 10,
                    bottom: 150,
                    left: 320,
                    top: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          var dialog = CustomAlertDialog(
                              title: 'Logout',
                              message: ' You want logout',
                              onPostivePressed: () {
                                userController.signOut();
                              },
                              positiveBtnText: 'Yes',
                              negativeBtnText: 'No');
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => dialog);
                        },
                        child: Icon(
                          Icons.logout_outlined,
                          color: AppColorCode.pureWhite,
                          size: 25,
                        ),
                      ),
                    )),
              ],
            ),
          ),

          SizedBox(
            height: 10,
          ),
          // if (ctr.apiLoading!.value)
          //   Center(child: CircularProgressIndicator.adaptive()),
        ],
      ));
    });
  }
}
