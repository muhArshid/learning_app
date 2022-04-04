import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/Models/cart_item_res.dart';
import 'package:learning_app/Models/course_res.dart';
import 'package:learning_app/Views/Screens/Home/course_details.dart';
import 'package:learning_app/Views/widgets/button_icons_widgets.dart';
import 'package:learning_app/utils/AppColorCode.dart';
import 'package:learning_app/utils/AppFontOswald.dart';
import 'package:sizer/sizer.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key, this.cartItem}) : super(key: key);
  final CartItemModel? cartItem;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: InkWell(
        onTap: () {
          Get.to(() => CourseDetailsScreen());
        },
        child: Container(
          height: 70.h,
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
                  color: AppColorCode.brandColor,
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
                  Text(
                    'name',
                    style: AppFontMain(
                      color: AppColorCode.primaryTextHalf,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    width: 2.h,
                  ),
                  Text(
                    'name color: AppColorCode.primaryTextHalf',
                    style: AppFontMain(
                      color: AppColorCode.secondaryText,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 2.h,
                  ),
                  const Divider(
                    thickness: .1,
                    color: AppColorCode.primaryTextHalf,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Quantity:',
                              style: AppFontMain(
                                color: AppColorCode.primaryTextHalf,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: AppColorCode.brandColor,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Center(
                                      child: Text(
                                        '-',
                                        style: AppFontMain(
                                          color: AppColorCode.pureWhite,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColorCode.primaryText),
                                        color: AppColorCode.pureWhite,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Center(
                                      child: Text(
                                        '1',
                                        style: AppFontMain(
                                          color: AppColorCode.primaryTextHalf,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: AppColorCode.brandColor,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Icon(
                                      Icons.add,
                                      color: AppColorCode.pureWhite,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ]),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price:',
                            style: AppFontMain(
                              color: AppColorCode.primaryTextHalf,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'AED 234',
                            style: AppFontMain(
                              color: AppColorCode.primaryTextHalf,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Total:',
                            style: AppFontMain(
                              color: AppColorCode.primaryTextHalf,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'AED 234',
                            style: AppFontMain(
                              color: AppColorCode.brandColor,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Center(
                    child: button(
                        label: 'Checkout',
                        height: size.height * 0.07,
                        width: size.width * 0.80,
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
