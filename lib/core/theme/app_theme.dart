import 'package:flutter/material.dart';
import 'package:tt/core/theme/text_themes.dart';
import 'package:tt/core/theme/time_picker_custom_style.dart';
import 'package:tt/core/utils/app_colors.dart';

//App theme of the all app
final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        )),
    useMaterial3: true,
    fontFamily: "Cairo",
    primaryColor: AppColors.primaryColor,
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    ////////// app bar///////////

    //Style of Outlined Button for the whole app
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
        textStyle: TextStyle(
          color: AppColors.primaryColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 18))),
    //Elevated Button Design for the whole app
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteColor,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    //For App Bar Theme
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: AppColors.blackColor),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.blackColor,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    ),
    //For Card Design Theme
    cardTheme: const CardTheme(
      color: AppColors.whiteColor,
    ),

    //For Text Theme the whole app
    textTheme: CustomTextTheme.textTheme,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blackColor),
    listTileTheme: const ListTileThemeData(
        titleTextStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor),
        subtitleTextStyle: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor)),
    timePickerTheme: customTimePicker,
    inputDecorationTheme: const InputDecorationTheme(
        fillColor: AppColors.primaryColor,
        suffixIconColor: Color(0xffE7E7E7),
        prefixIconColor: AppColors.blackColor,
        hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.blackColor),
        labelStyle: TextStyle(color: Color(0xffE7E7E7), fontSize: 16)));
////////////////////
////////////////////
////////////////////
// final ThemeData darkTheme = ThemeData(
//   floatingActionButtonTheme: FloatingActionButtonThemeData(
//       backgroundColor: AppColors.primaryColor,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(18),
//       )),
//   useMaterial3: true,
//   scaffoldBackgroundColor: Colors.black,
//   fontFamily: "r",
//   primaryColor: AppColors.primaryColor,
//   bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xff1F1F1F)),
//   drawerTheme: const DrawerThemeData(backgroundColor: Color(0xff333333)),
//   inputDecorationTheme: const InputDecorationTheme(
//       fillColor: Color(0xff2A2A2A),
//       suffixIconColor: Color(0xffE7E7E7),
//       prefixIconColor: Color(0xffE7E7E7),
//       hintStyle: TextStyle(
//           fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xffE7E7E7)),
//       labelStyle: TextStyle(color: Color(0xffE7E7E7), fontSize: 16)),
//   //Style of Outlined Button for the whole app
//   outlinedButtonTheme: OutlinedButtonThemeData(
//     style: OutlinedButton.styleFrom(
//       foregroundColor: AppColors.primaryColor,
//       textStyle: TextStyle(
//         color: AppColors.primaryColor,
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(5),
//       ),
//     ),
//   ),
//   textButtonTheme: TextButtonThemeData(
//       style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 18))),
//   //Elevated Button Design for the whole app
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: AppColors.primaryColor,
//       foregroundColor: AppColors.blackColor,
//       elevation: 8,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//     ),
//   ),
//   //For App Bar Theme
//   appBarTheme: const AppBarTheme(
//     scrolledUnderElevation: 0,
//     backgroundColor: AppColors.blackColor,
//     iconTheme: IconThemeData(color: AppColors.whiteColor),
//     elevation: 0,
//     titleTextStyle: TextStyle(
//       color: AppColors.blackColor,
//       fontWeight: FontWeight.bold,
//       fontSize: 24,
//     ),
//   ),
//   //For Card Design Theme
//   cardTheme: const CardTheme(
//     color: AppColors.blackColor,
//   ),

//   //For Text Theme the whole app
//   textTheme: darkTxtTheme,
//   //
//   colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blackColor),
//   listTileTheme: const ListTileThemeData(
//       titleTextStyle: TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.bold,
//           color: AppColors.whiteColor),
//       subtitleTextStyle: TextStyle(
//           fontSize: 10,
//           fontWeight: FontWeight.bold,
//           color: AppColors.whiteColor)),
//   timePickerTheme: customTimePicker,
