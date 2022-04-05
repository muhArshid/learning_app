import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/Controller/course_controller.dart';
import 'package:learning_app/Service/network/HttpConstants.dart';
import 'package:learning_app/Views/Screens/Home/widgets.dart';
import 'package:learning_app/Views/widgets/button_icons_widgets.dart';
import 'package:learning_app/utils/AppColorCode.dart';
import 'package:learning_app/utils/AppFontOswald.dart';
import 'package:learning_app/utils/controllers.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoaded = true;
  void initState() {
    apiCall();

    super.initState();
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void apiCall() async {
    await courseCtr.mainCourseDatails();
    if (mounted) {
      setState(() {
        isLoaded = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColorCode.bgColor,
          body: GetBuilder<CourseContoller>(builder: (ct) {
            return ListView(
              children: [
                ct.homeData != null
                    ? Container(
                        height: 30.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(HttpConstants.imageUrl +
                                    ct.homeData!.banner!.banner!))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 40),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ct.homeData!.banner!.bannerTitle!,
                                  style: AppFontMain(
                                    color: AppColorCode.pureWhite,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 1.h),
                                Text(
                                  'Build skil with course certificates online',
                                  style: AppFontMain(
                                    color: AppColorCode.pureWhite,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Container(
                                  margin: EdgeInsets.all(1),
                                  height: 6.h,
                                  width: 35.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: AppColorCode.pureWhite),
                                  ),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          'Get Started',
                                          style: AppFontMain(
                                            color: AppColorCode.pureWhite,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          color: AppColorCode.pureWhite,
                                          size: 16,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                        ))
                    : Center(
                        child: CircularProgressIndicator.adaptive(
                        backgroundColor: AppColorCode.brandColor,
                      )),
                Container(
                  height: 150.h,
                  width: 100.w,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CourseMainCard(data: ct.dataList[index]);
                    },
                    itemCount: ct.dataList.length,
                  ),
                ),
              ],
            );
          })),
    );
  }
}
