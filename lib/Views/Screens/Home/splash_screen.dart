// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:learning_app/Views/Screens/Auth/login.dart';
// import 'package:learning_app/Views/widgets/button_icons_widgets.dart';
// import 'package:learning_app/utils/AppColorCode.dart';
// import 'package:learning_app/utils/AppFontOswald.dart';
// import 'package:learning_app/utils/AssetConstants.dart';
// import 'package:sizer/sizer.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     Future.delayed(const Duration(seconds: 1), () {});
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: AppColorCode.bgColor,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Padding(
//           //   padding: const EdgeInsets.symmetric(
//           //     horizontal: 60,
//           //   ),
//           //   child: Image.asset(AssetConstant.logo),
//           // ),
//           SizedBox(height: 5.h),
//           Text(
//             AssetConstant.appName,
//             style: AppFontMain(
//               color: AppColorCode.brandColor,
//               fontSize: 36,
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//           SizedBox(height: 10.h),
//           button(
//               label: 'Sign In',
//               height: size.height * 0.07,
//               width: size.width * 0.60,
//               buttonColor: AppColorCode.brandColor,
//               onTap: () async {
//                 Get.to(() => LoginScreen());
//               }),
//           SizedBox(height: 3.h),
//           button(
//               label: 'Register',
//               height: size.height * 0.07,
//               width: size.width * 0.60,
//               buttonColor: AppColorCode.brandColor,
//               onTap: () async {}),
//           const SizedBox(height: 30),
//           InkWell(
//             onTap: () {},
//             child: Text(
//               'Take Tour',
//               style: AppFontMain(
//                 color: AppColorCode.primaryTextHalf,
//                 fontSize: 24,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
