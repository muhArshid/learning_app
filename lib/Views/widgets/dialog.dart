import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/utils/AppColorCode.dart';
import 'package:learning_app/utils/AppFontOswald.dart';

class CustomAlertDialog extends StatelessWidget {
  final Color? bgColor;
  final String? title;
  final String? message;
  final String? positiveBtnText;
  final String? negativeBtnText;
  final Function? onPostivePressed;
  final Function? onNegativePressed;
  final double? circularBorderRadius;

  CustomAlertDialog({
    this.title,
    this.message,
    this.circularBorderRadius = 15.0,
    this.bgColor = Colors.white,
    this.positiveBtnText,
    this.negativeBtnText,
    this.onPostivePressed,
    this.onNegativePressed,
  })  : assert(bgColor != null),
        assert(circularBorderRadius != null);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null
          ? Text(
              title!,
              style: AppFontMain(
                color: AppColorCode.brandColor,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            )
          : null,
      content: message != null
          ? Text(
              message!,
              style: AppFontMain(
                color: AppColorCode.brandColor,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            )
          : null,
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularBorderRadius!)),
      actions: <Widget>[
        negativeBtnText != null
            ? FlatButton(
                child: Text(
                  negativeBtnText!,
                  style: AppFontMain(
                    color: AppColorCode.brandColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                textColor: Theme.of(context).accentColor,
                onPressed: () {
                  Navigator.of(context).pop();
                  if (onNegativePressed != null) {
                    onNegativePressed!();
                  }
                },
              )
            : Container(),
        positiveBtnText != null
            ? FlatButton(
                child: Text(
                  positiveBtnText!,
                  style: AppFontMain(
                    color: AppColorCode.brandColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                textColor: Theme.of(context).colorScheme.secondary,
                onPressed: () {
                  if (onPostivePressed != null) {
                    onPostivePressed!();
                  }
                },
              )
            : Container(),
      ],
    );
  }
}

errorDialog(String mssg) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'OOPS..',
              style: AppFontMain(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                mssg,
                style:
                    AppFontMain(fontSize: 14, color: AppColorCode.brandColor),
                // overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () => Get.back(),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColorCode.brandColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'OKAY',
                      style: AppFontMain(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
