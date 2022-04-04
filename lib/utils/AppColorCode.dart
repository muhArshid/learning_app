import 'package:flutter/material.dart';

class AppColorCode {
  static const Color primaryTextHalf = Color(0xFF000000);
  static const Color brandColor = Color(0xFF0D47A1);
  static const Color pureWhite = Color(0xFFFFFFFF);
  static const Color primaryText = Color(0xFF2A4A88);
  static const Color borderColor = Color(0xFFEEEEEE);
  static const Color lineColor = Color(0xEEEEEEEE);
  static const Color goldColor = Color(0xFFF9A825);
  static const Color red = Color(0xFFF44336);
  //butten
  static const Color butColor = Color(0xFF2A4A88);
  static const Color buttonGray = Color.fromRGBO(10, 132, 255, 1);
  static const Color border = Color(0xFFEDF0F2);
  static const Color bgColor = Color(0xFFF8F9FB);

  static const Color secondaryText = Color(0xFF8F97A0);
  static const Color mainBlue = Color(0xFF37929A);
  static const Color mainGreyBg = Color(0xFFF1F3F6);
  static const Color backgroundColor = Color(0xFFE5E5E5);
  static const Color discountBg = Color(0xFFF1F9FE);
  static const Color rose = Color(0xFFFFEEDF);
  static const Color dateBg = Color(0xFFF3FEFF);
}

class ColorAdapter {
  static Color getColorFromHex(String hexColor) {
    if (hexColor.length == 7) {
      hexColor = hexColor.replaceFirst('#', '');
      hexColor = "FF" + hexColor;
    } else {
      hexColor = 'FFFF8D13';
    }
    var integer = int.parse(hexColor, radix: 16);
    return Color(integer);
  }
}
