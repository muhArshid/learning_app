import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:learning_app/Service/network/HttpConstants.dart';
import 'package:learning_app/utils/controllers.dart';
import 'package:sizer/sizer.dart';

import 'package:learning_app/Models/home_res.dart';
import 'package:learning_app/Views/Screens/Home/course_details.dart';
import 'package:learning_app/Views/widgets/button_icons_widgets.dart';
import 'package:learning_app/utils/AppColorCode.dart';
import 'package:learning_app/utils/AppFontOswald.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class CourseMainCard extends StatelessWidget {
  const CourseMainCard({Key? key, this.data}) : super(key: key);
  final HorizontalSlider? data;

  @override
  Widget build(BuildContext context) {
    return data != Null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 2.h),
                    Text(
                      data!.heading!,
                      style: AppFontMain(
                        color: AppColorCode.primaryTextHalf,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Divider(
                      color: AppColorCode.secondaryText,
                      thickness: 4,
                    ),
                  ],
                ),
              ),
              Container(
                height: 120.h,
                width: 80.w * data!.data!.length,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CourseCard(data: data!.data![index]);
                  },
                  itemCount: data!.data!.length,
                ),
              ),
            ],
          )
        : Container();
  }
}

class CourseCard extends StatelessWidget {
  const CourseCard({Key? key, this.data}) : super(key: key);
  final Data? data;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {
          Get.to(() => CourseDetailsScreen(
                id: data!.id!,
              ));
        },
        child: Container(
          height: 150.h,
          width: 80.w,
          decoration: BoxDecoration(
              color: AppColorCode.pureWhite,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: AppColorCode.primaryText,
                    offset: Offset(3, 2),
                    blurRadius: 7)
              ]),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                height: 25.h,
                width: 100.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          HttpConstants.imageUrl + data!.listingImage!)),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                )),
            SizedBox(
              width: 2.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 40.w,
                        child: Text(
                          data!.title!,
                          style: AppFontMain(
                            color: AppColorCode.primaryTextHalf,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          if (data!.rating != null)
                            Text(
                              data!.rating.toString(),
                              style: AppFontMain(
                                color: AppColorCode.goldColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          RatingBar.builder(
                            itemSize: 15,
                            initialRating: data!.rating != null
                                ? data!.rating!.toDouble()
                                : 1,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: .1),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: AppColorCode.goldColor,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          Text(
                            data!.ratingCount.toString(),
                            style: AppFontMain(
                              color: AppColorCode.secondaryText,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    width: 80.w,
                    height: 60.h,
                    child: Center(
                      child: HtmlWidget(
                        data!.description!,
                        textStyle: AppFontMain(
                          color: AppColorCode.secondaryText,
                          fontSize: 11,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  const Divider(
                    thickness: .1,
                    color: AppColorCode.primaryTextHalf,
                  ),
                  Text(
                    data!.currencyCode! + data!.actualPrice!,
                    style: AppFontMain(
                      color: AppColorCode.brandColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Center(
                    child: button(
                        label: 'Buy Now',
                        height: size.height * 0.07,
                        width: size.width * 0.70,
                        buttonColor: AppColorCode.brandColor,
                        onTap: () async {}),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class EmptySreen extends StatelessWidget {
  const EmptySreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColorCode.bgColor,
    ));
  }
}
