import 'package:flutter/material.dart';

//Class that will contain all Colors thought the App
class AppColors {
  // static Color primaryColor = Color(int.parse('0xff${Get.find<AppSettings>().data!.colorAndroid1!.substring(1,7)}'));
  //?? Color(0xffFF002A);
  static const List<Color> gradient = [
    Color(0xff0B57CF),
    Color(0xff062C69),
  ];
  static const Color primaryColor = Color(0xff5F33E1);
  static Color lightPrimaryColor = const Color(0xffB3CBF0).withOpacity(0.15);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color blackColor = Color(0xff00070D);
  static const Color offWhite = Color(0xff545454);
  static const Color textLightGreyColor = Color(0xffB0B0B0);
  static const Color textDarkGreyColor = Color(0xffE8E8E8);
  static const Color navigationUnSelected = Color(0xff8C8C8C);
  static const Color textWhiteSubtitleColor = Color(0xffB7D7FF);
  static Color textInputBorderColor =
      const Color(0xff00000040).withOpacity(0.25);
  static const Color greenColor = Color(0xff00A92F);
  static const redColor = Color(0xffFF0000);
  static const redAlertColor = Color(0xffD03E2A);
  static const yellowColor = Color(0xffE4D21F);
  static const starYellow = Color(0xffFBE722);
  static const Color secondaryColor = Color(0xff020202);
  static const Color textfieldBgColor = Color(0xffF9FAFB);
  static const Color textfieldBorderColor = Color(0xffF1F3F9);
  static const Color textfieldHintTxtColor = Color(0xff96A0B6);
  static const Color text300Color = Color(0xff010b13);
  static const Color lightGray = Color(0xffB5B5B5);
  static const Color bgGrey = Color(0xff6E6A7C);

//   static Color whiteBlack(context) {
//     final appSettings = Get.theme.brightness;

//     if (appSettings == Brightness.dark) {
//       return blackColor;
//     } else {
//       return whiteColor;
//     }
//   }

// // set primary color from app sittings
//   static setPrimary(String? color) {
//     if (color != null) {
//       primaryColor = Color(int.parse('0xff${color.substring(1, 7)}'));
//     }
//   }
}
