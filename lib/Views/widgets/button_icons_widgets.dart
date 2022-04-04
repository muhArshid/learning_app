import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/utils/AppColorCode.dart';
import 'package:learning_app/utils/AppFontOswald.dart';
import 'package:learning_app/utils/AssetConstants.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/services.dart';

Widget button({
  required double width,
  required double height,
  required Function() onTap,
  required String label,
  Color labelColor = AppColorCode.bgColor,
  Color buttonColor = AppColorCode.brandColor,
  Icon? icondata,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          label,
          style: AppFontMain(
            color: labelColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
  );
}

Widget loadingButton(
    {required double width,
    required double height,
    required Function() onTap,
    required String label,
    Color labelColor = AppColorCode.pureWhite,
    Color buttonColor = AppColorCode.brandColor}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: CircularProgressIndicator(
          color: AppColorCode.pureWhite,
        )),
      ),
    ),
  );
}

Widget authbutton({
  required double width,
  required double height,
  required Function() onTap,
  required String label,
  required String iconName,
  Color labelColor = AppColorCode.primaryTextHalf,
  Color buttonColor = Colors.white,
  Icon? icondata,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: height,
      width: width,
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        border: Border.all(color: labelColor),
        color: buttonColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconName),
            SizedBox(
              width: 10,
            ),
            Text(
              label,
              style: AppFontMain(
                color: labelColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildtextForm(
    {String? label,
    String? hintText,
    bool obscureText = false,
    Widget? suffixIcon,
    TextInputType keyboardType = TextInputType.text,
    int minLines = 1,
    int maxLines = 1,
    TextEditingController? controller,
    String? Function(String?)? validator,
    Function()? onTap}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      label != null
          ? Text(
              label,
              style: AppFontMain(
                color: AppColorCode.primaryText,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            )
          : SizedBox(height: 10),
      SizedBox(height: 10),
      Container(
        // height: 55,
        child: TextFormField(
          onTap: onTap,
          controller: controller,
          validator: validator,
          minLines: minLines,
          maxLines: maxLines,
          keyboardType: keyboardType,
          obscureText: obscureText,
          cursorColor: AppColorCode.primaryText,
          style: AppFontMain(
            color: AppColorCode.primaryText,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(10, 8, 8, 0),
            suffixIcon: suffixIcon,
            hintText: hintText,
            fillColor: Colors.white,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(color: AppColorCode.border),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(color: Colors.red),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.0),
              borderSide: BorderSide(
                color: AppColorCode.border,
                width: 1.0,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget buildtextFormLogin({
  String? label,
  String? hintText,
  bool obscureText = false,
  Widget? suffixIcon,
  TextInputType keyboardType = TextInputType.text,
  int minLines = 1,
  int maxLines = 1,
  TextEditingController? controller,
  String? Function(String?)? validator,
  Widget? coutomIcon,
}) {
  return SizedBox(
    width: 40.h,
    //  height: 14.w,
    child: TextFormField(
      showCursor: true,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: AppFontMain(
        color: AppColorCode.brandColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      controller: controller,
      validator: validator,
      maxLines: 1,
      decoration: InputDecoration(
        //   filled: true,
        hintText: hintText,

        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColorCode.secondaryText),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColorCode.brandColor),
        ),
        hintStyle: AppFontMain(
          color: AppColorCode.primaryTextHalf,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        border: InputBorder.none,
      ),
    ),
  );
}

class CustomCeckBox extends StatefulWidget {
  CustomCeckBox(this.onChange, this.text);
  final Function onChange;
  final String text;
  @override
  _CustomCeckBoxState createState() => _CustomCeckBoxState();
}

class _CustomCeckBoxState extends State<CustomCeckBox> {
  bool _value = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        setState(() {
          widget.onChange(!_value);
          _value = !_value;
        })
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Row(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: _value
                    ? Icon(
                        Icons.check_box,
                        color: AppColorCode.brandColor,
                        size: 20,
                      )
                    : Icon(
                        Icons.check_box_outline_blank,
                        color: AppColorCode.brandColor,
                        size: 20,
                      ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              widget.text,
              style: AppFontMain(
                color: AppColorCode.bgColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget backButtonCherv(BuildContext context) => InkWell(
      onTap: () => Get.back(),
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            child: const Center(
                child: Icon(
              Icons.arrow_back,
              color: Colors.red,
            )),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
            height: MediaQuery.of(context).size.height * .055,
            width: MediaQuery.of(context).size.width * .11,
          )),
    );
Widget appBar({String? label}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  // color: AppColorCode.mainGreyBg,
                ),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColorCode.bgColor,
                    size: 30,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.edit,
                  color: AppColorCode.bgColor,
                  size: 30,
                ),
                const SizedBox(width: 20),
                Icon(
                  Icons.format_align_left_sharp,
                  color: AppColorCode.bgColor,
                  size: 30,
                ),
              ],
            ),
          ],
        ),
      ),
      Divider(
        thickness: .10,
        color: AppColorCode.backgroundColor,
      )
    ],
  );
}
