import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:learning_app/Views/Screens/Cart/cart_screen.dart';
import 'package:learning_app/Views/Screens/Home/home_screen.dart';
import 'package:learning_app/Views/Screens/Home/widgets.dart';
import 'package:learning_app/Views/Screens/Profile/profile_screen.dart';
import 'package:learning_app/utils/AppColorCode.dart';
import 'package:learning_app/utils/AppFontOswald.dart';
import 'package:learning_app/utils/AssetConstants.dart';

class MainHomeHolder extends StatefulWidget {
  final int? currentIndex;
  MainHomeHolder({this.currentIndex, Key? key}) : super(key: key);

  @override
  _MainHomeHolderState createState() => _MainHomeHolderState();
}

class _MainHomeHolderState extends State<MainHomeHolder> {
  int currentIndex = 0;
  // MainController mainCt = Get.find();

  @override
  void initState() {
    if (widget.currentIndex != null) {
      currentIndex = widget.currentIndex!;
    }
    super.initState();
  }

  Widget callpage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return EmptyScreen();
      case 2:
        return EmptyScreen();
      case 3:
        return CartScreen();
      case 4:
        return ProfileScreen();

      default:
        return HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    void onTabTapped(int index) {
      setState(() {
        currentIndex = index;
      });
    }

    BottomNavigationBarItem bottomNavigationBarItem({
      int? index,
      IconData? icon,
      String? label,
    }) =>
        BottomNavigationBarItem(
          label: label!,
          activeIcon: Icon(
            icon!,
            color: currentIndex == index
                ? AppColorCode.brandColor
                : AppColorCode.primaryTextHalf,
            size: 20,
          ),
          icon: Icon(
            icon,
            color: currentIndex == index
                ? AppColorCode.brandColor
                : AppColorCode.primaryTextHalf,
            size: 20,
          ),
        );

    DateTime? _lastQuitTime;
    return WillPopScope(
      onWillPop: () async {
        if (_lastQuitTime == null ||
            DateTime.now().difference(_lastQuitTime!).inSeconds > 2) {
          Fluttertoast.showToast(
              msg: 'Press again Back Button exit',
              backgroundColor: AppColorCode.brandColor);
          Get.back();
          _lastQuitTime = DateTime.now();
          return false;
        } else {
          print('Exited');
          Get.back(result: true);
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: callpage(currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          onTap: onTabTapped,
          currentIndex: currentIndex,
          fixedColor: Colors.black,
          items: <BottomNavigationBarItem>[
            bottomNavigationBarItem(
              index: 0,
              label: 'Home',
              icon: Icons.home,
            ),
            bottomNavigationBarItem(
              index: 1,
              label: 'Course',
              icon: Icons.play_circle_outline_outlined,
            ),
            bottomNavigationBarItem(
              index: 2,
              label: 'Exam',
              icon: Icons.plagiarism_outlined,
            ),
            bottomNavigationBarItem(
              index: 3,
              label: 'Cart',
              icon: Icons.shopping_cart_rounded,
            ),
            bottomNavigationBarItem(
              index: 4,
              label: 'Account',
              icon: Icons.person_outline_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
