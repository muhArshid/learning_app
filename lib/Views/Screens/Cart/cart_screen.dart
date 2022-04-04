import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/Views/Screens/Cart/widgets.dart';
import 'package:learning_app/utils/AppColorCode.dart';
import 'package:learning_app/utils/AppFontOswald.dart';
import 'package:learning_app/utils/controllers.dart';
import 'package:sizer/sizer.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColorCode.bgColor,
            body: ListView(children: [
              Container(
                height: 40.h,
                width: 100.w,
                decoration: BoxDecoration(color: AppColorCode.brandColor),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColorCode.pureWhite,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
                      Text(
                        'Cart',
                        style: AppFontMain(
                          color: AppColorCode.pureWhite,
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        'Home / Cart',
                        style: AppFontMain(
                          color: AppColorCode.pureWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Container(
              //   height: 90.h * 2,
              //   width: 100.w,
              //   child: ListView.builder(
              //     physics: NeverScrollableScrollPhysics(),
              //     scrollDirection: Axis.vertical,
              //     itemBuilder: (context, index) {
              //       return CartCard();
              //     },
              //     itemCount: 2,
              //   ),
              // ),
              userController.userModel.value.cart != null
                  ? Obx(() => Column(
                        children: userController.userModel.value.cart!
                            .map((cartItem) => CartCard(
                                  cartItem: cartItem,
                                  key: UniqueKey(),
                                ))
                            .toList(),
                      ))
                  : Center(
                      child: Text('Cart Emty',
                          style: AppFontMain(
                            color: AppColorCode.brandColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
              SizedBox(
                height: 2.h,
              ),
            ])));
  }
}
