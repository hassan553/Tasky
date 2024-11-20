import 'package:flutter/material.dart';
import 'package:tt/core/utils/app_colors.dart';

TimePickerThemeData customTimePicker = TimePickerThemeData(
    backgroundColor: AppColors.whiteColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(0)),
    ),
    hourMinuteShape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(0)),
    ),
    hourMinuteColor: WidgetStateColor.resolveWith((states) =>
        states.contains(WidgetState.selected)
            ? Colors.grey.shade200
            : Colors.grey.shade300),
    hourMinuteTextColor: WidgetStateColor.resolveWith((states) =>
        states.contains(WidgetState.selected)
            ? AppColors.primaryColor
            : AppColors.blackColor),
    hourMinuteTextStyle:
        const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
    dayPeriodColor: WidgetStateColor.resolveWith((states) =>
        states.contains(WidgetState.selected)
            ? Colors.grey.shade200
            : Colors.white),
    dayPeriodTextStyle:
        const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    dayPeriodShape: const LinearBorder(side: BorderSide(color: Colors.white)),
    dayPeriodBorderSide: BorderSide.none,
    dialHandColor: AppColors.primaryColor,
    dialBackgroundColor: Colors.white,
    dialTextStyle: const TextStyle(
        color: AppColors.blackColor, fontSize: 16, fontWeight: FontWeight.bold),
    dialTextColor: WidgetStateColor.resolveWith((states) =>
        states.contains(WidgetState.selected) ? Colors.white : AppColors.blackColor),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      contentPadding: EdgeInsets.all(0),
    ),
    helpTextStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.blackColor),
    entryModeIconColor: AppColors.blackColor,
    elevation: 0,
    cancelButtonStyle: ButtonStyle(textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 40))),
    confirmButtonStyle: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)));
