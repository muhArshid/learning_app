import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:learning_app/Controller/course_controller.dart';
import 'package:learning_app/Models/course_res.dart';
import 'package:learning_app/Service/network/HttpConstants.dart';
import 'package:learning_app/Views/Screens/Cart/cart_screen.dart';
import 'package:learning_app/Views/Screens/Home/widgets.dart';
import 'package:learning_app/Views/widgets/button_icons_widgets.dart';
import 'package:learning_app/Views/widgets/text.dart';
import 'package:learning_app/utils/AppColorCode.dart';
import 'package:learning_app/utils/AppFontOswald.dart';
import 'package:learning_app/utils/controllers.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:video_player/video_player.dart';

class CourseDetailsScreen extends StatefulWidget {
  CourseDetailsScreen({Key? key, this.id}) : super(key: key);
  final int? id;
  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  bool isLoaded = true;
  bool showMore = true;
  bool vedioPlay = false;

  @override
  void initState() {
    super.initState();
    apiCall();
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void apiCall() async {
    var data = widget.id.toString();
    await courseCtr.courseDatails(data);
    if (mounted) {
      setState(() {
        isLoaded = false;
      });
    }
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColorCode.bgColor,
            body: GetBuilder<CourseContoller>(builder: (ct) {
              var data = ct.courseData!.data!;
              return ListView(children: [
                Container(
                    height: 40.h,
                    width: 100.w,
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            vedioPlay = true;
                            // videoPlayerController.value.isPlaying
                            //     ? videoPlayerController.pause()
                            //     : videoPlayerController.play();
                          });
                        },
                        child: vedioPlay
                            ? VideoPlayerScreen(
                                height: 40.h,
                                width: 100.w,
                                url: HttpConstants.imageUrl + data.teaserVideo!,
                              )
                            : Stack(alignment: Alignment.center, children: [
                                const CircleAvatar(
                                  backgroundColor: Colors.white10,
                                  radius: 50,
                                ),
                                const CircleAvatar(
                                  backgroundColor: Colors.white54,
                                  radius: 40,
                                ),
                                const CircleAvatar(
                                  backgroundColor: Colors.white70,
                                  radius: 30,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 20,
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: AppColorCode.brandColor,
                                  ),
                                ),
                              ]),
                      ),
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                HttpConstants.imageUrl + data.listingImage!)))),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data.title!,
                            style: AppFontMain(
                              color: AppColorCode.brandColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColorCode.goldColor),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'BestSeller',
                                style: AppFontMain(
                                  color: AppColorCode.goldColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Container(
                        width: 80.w,
                        height: 20.h,
                        child: HtmlWidget(
                          data.shortDescription!,
                          textStyle: AppFontMain(
                            color: AppColorCode.secondaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const Divider(
                        color: AppColorCode.secondaryText,
                        thickness: .4,
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        children: [
                          if (data.rating != null)
                            Text(
                              data.rating,
                              style: AppFontMain(
                                color: AppColorCode.goldColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          RatingBar.builder(
                            itemSize: 20,
                            initialRating: 5,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: AppColorCode.goldColor,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        '(' +
                            ' data.rating! ' +
                            '),' +
                            data.ratingCount.toString() +
                            'students',
                        style: AppFontMain(
                          color: AppColorCode.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        children: [
                          Text(
                            'Created by',
                            style: AppFontMain(
                              color: AppColorCode.primaryTextHalf,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 2.h),
                          Text(
                            data.createdBy!,
                            style: AppFontMain(
                              color: AppColorCode.brandColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        children: [
                          Icon(
                            Icons.loop_rounded,
                            color: AppColorCode.secondaryText,
                          ),
                          SizedBox(width: 1.h),
                          Text(
                            'Last Update',
                            style: AppFontMain(
                              color: AppColorCode.secondaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 2.h),
                          Text(
                            '20 Hourse ago',
                            style: AppFontMain(
                              color: AppColorCode.primaryTextHalf,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        children: [
                          Icon(
                            Icons.event_rounded,
                            color: AppColorCode.secondaryText,
                          ),
                          SizedBox(width: 1.h),
                          Text(
                            'Course  Validity',
                            style: AppFontMain(
                              color: AppColorCode.secondaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 2.h),
                          Text(
                            '1 year',
                            style: AppFontMain(
                              color: AppColorCode.primaryTextHalf,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        children: [
                          Text(
                            data.price!,
                            style: AppFontMain(
                              color: AppColorCode.brandColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 2.h),
                          Text(
                            data.actualPrice!,
                            style: AppFontMain(
                              decoration: TextDecoration.lineThrough,
                              color: AppColorCode.secondaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        children: [
                          Icon(
                            Icons.restore_outlined,
                            color: AppColorCode.red,
                          ),
                          SizedBox(width: 1.h),
                          Text(
                            data.offers!,
                            style: AppFontMain(
                              color: AppColorCode.red,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.h),
                      Center(
                        child: button(
                            label: 'Buy Now',
                            height: size.height * 0.07,
                            width: size.width * 0.60,
                            buttonColor: AppColorCode.brandColor,
                            onTap: () async {
                              cartController.addProductToCart(data);

                              // Get.to(() => CartScreen());
                            }),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        'What will learn?',
                        style: AppFontMain(
                          color: AppColorCode.primaryTextHalf,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Container(
                        height: showMore
                            ? 2.h * data.learningNotes!.length
                            : 5.h * data.learningNotes!.length,
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: data.learningNotes!.length,
                            itemBuilder: (context, index) {
                              return learnCard(data.learningNotes![index]);
                            }),
                      ),
                      SizedBox(height: 1.h),
                      InkWell(
                        onTap: () {
                          setState(() {
                            showMore = !showMore;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            showMore ? 'show more' : 'show less',
                            style: AppFontMain(
                              color: AppColorCode.primaryTextHalf,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Course condent',
                            style: AppFontMain(
                              color: AppColorCode.primaryTextHalf,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.folder_open_outlined,
                                color: AppColorCode.brandColor,
                                size: 15,
                              ),
                              SizedBox(width: 1.w),
                              Text(
                                data.totalLessons.toString() + ' Lessons',
                                style: AppFontMain(
                                  color: AppColorCode.secondaryText,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Icon(
                                Icons.access_time,
                                color: AppColorCode.brandColor,
                                size: 15,
                              ),
                              Text(
                                data.totalDuration.toString() + ' Hours',
                                style: AppFontMain(
                                  color: AppColorCode.secondaryText,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 17.h * data.courseChapter!.length + ct.length,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: data.courseChapter!.length,
                      itemBuilder: (context, index) {
                        return ChapterCard(
                          chapterData: data.courseChapter![index],
                        );
                      }),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: AppFontMain(
                          color: AppColorCode.primaryTextHalf,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 80.w,
                        height: 50.h,
                        child: HtmlWidget(
                          data.description!,
                          textStyle: AppFontMain(
                            color: AppColorCode.secondaryText,
                            fontSize: 11,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]);
            })));
  }
}

class ChapterCard extends StatefulWidget {
  ChapterCard({Key? key, this.chapterData}) : super(key: key);
  final CourseChapter? chapterData;
  @override
  State<ChapterCard> createState() => _ChapterCardState();
}

class _ChapterCardState extends State<ChapterCard> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 15.h,
            width: 90.w,
            decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(1)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Module' + widget.chapterData!.chaptersCount.toString(),
                        style: AppFontMain(
                          color: AppColorCode.brandColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 3.h,
                            width: 20.w,
                            child: Text(
                              widget.chapterData!.chapterTitle!,
                              style: AppFontMain(
                                color: AppColorCode.primaryTextHalf,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            '(' +
                                widget.chapterData!.durationCount.toString() +
                                ' min/' +
                                widget.chapterData!.chaptersCount.toString() +
                                ' part)',
                            style: AppFontMain(
                              color: AppColorCode.secondaryText,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        show = !show;
                        courseCtr.updatelength(
                            show, widget.chapterData!.chapters!.length);
                      });
                    },
                    child: Icon(
                      show
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      color: AppColorCode.secondaryText,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        if (show)
          SizedBox(
              height: 30.h,
              child: ListView.builder(
                  itemCount: widget.chapterData!.chapters!.length,
                  itemBuilder: (context, index) {
                    return chapterContent(widget.chapterData!.chapters![index]);
                  })),
      ],
    );
  }

  Widget chapterContent(Chapters data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.insert_drive_file_outlined,
                  color: AppColorCode.primaryTextHalf,
                ),
                SizedBox(width: 1.w),
                SizedBox(
                  height: 5.h,
                  width: 50.w,
                  child: Center(
                    child: Text(
                      data.libraryName!,
                      style: AppFontMain(
                        color: AppColorCode.primaryTextHalf,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            data.duration.toString() + 'min',
            style: AppFontMain(
              color: AppColorCode.primaryTextHalf,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

Widget learnCard(LearningNotes data) {
  return Row(
    children: [
      Icon(
        Icons.check_circle_outline,
        color: AppColorCode.brandColor,
        size: 17,
      ),
      SizedBox(width: 2.w),
      SizedBox(
        width: 62.w,
        child: Text(
          data.text!,
          style: AppFontMain(
            color: AppColorCode.secondaryText,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ],
  );
}
