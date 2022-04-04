import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:learning_app/Models/course_res.dart';
import 'package:learning_app/Models/home_res.dart';
import 'package:learning_app/Service/api/main_api.dart';
import 'package:video_player/video_player.dart';

class CourseContoller extends GetxController {
  static CourseContoller instance = Get.find();

  HomeDetails? homeData;
  List<HorizontalSlider> dataList = <HorizontalSlider>[];
  mainCourseDatails() async {
    homeData = await GeneralAPI.getCourse();
    dataList = homeData!.horizontalSlider!
        .where((element) => element.data != null)
        .toList();

    update();
  }

  CourseDetails? courseData;
  courseDatails(String data) async {
    courseData = await GeneralAPI.getCourseDetails(data);
    length = 0;
    update();
  }

  int length = 0;
  updatelength(bool mode, int lengthData) {
    if (mode) {
      update();

      length = length + lengthData * 100;
    } else {
      length = length - lengthData * 100;
      update();
    }
  }

  VideoPlayerController? videoPlayerController;
}
