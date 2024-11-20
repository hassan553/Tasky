// import 'dart:io';

// import 'package:flutter/material.dart';
import 'dart:async';

import 'package:intl/intl.dart';

// import 'package:file_picker/file_picker.dart';
// import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:tt/core/utils/app_colors.dart';
// import 'package:tt/features/payment_feature/view/screen/payment_screen.dart';

// class AppFunctions {
//   static Future<DateTime?> showDatePickerFunction(BuildContext context) async {
//     return await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1800),
//       lastDate: DateTime.now(),
//     );
//   }

//   static initializeUserHomeRoute() {
//     // final AsnanAccountEnum accountType = getCashedUserAccountType();
//     // Get.find<AccountControllerService>().accountEnum = accountType;
//     // return defineUserController(accountType);
//   }

//   // static AsnanAccountEnum getCashedUserAccountType() {
//   //   return CashHelper.getData()
//   //       ? AsnanAccountEnum.doctor
//   //       : AsnanAccountEnum.patient;
//   // }

//   // static void navigateToCurrentUserTypeHome() {
//   //   if (Get.find<AccountControllerService>().accountEnum ==
//   //       AsnanAccountEnum.doctor) {
//   //     Get.offAllNamed();
//   //   } else {
//   //     Get.offAllNamed();
//   //   }
//   // }

//   static Future<File?> getImageFiles() async {
//     final result = await FilePicker.platform.pickFiles(
//         allowMultiple: false,
//         onFileLoading: (status) {
//           return const Center(child: CircularProgressIndicator());
//         },
//         type: FileType.custom,
//         allowedExtensions: ['png', 'jpg'],
//         withData: true);

//     if (result != null) {
//       final files = List<File>.from(result.paths.map((e) => File(e!)));
//       return files[0];
//     } else {
//       return null;
//     }
//   }

FutureOr<String?> pickImageFromGallery({bool isMultiPick = false}) async {
  if (isMultiPick) {
    final result = await ImagePicker().pickMultiImage(
      imageQuality: 100,
    );
    if (result.isNotEmpty) {
      return result[0].path;
    }
  } else {
    final result = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );

    if (result != null) {
      return result.path;
    }
  }
  return null;
}

//   static calculateFrom({required DateTime start}) {
//     final difference = start.difference(DateTime.now());
//     int days = difference.inDays;
//     int hours = difference.inHours % 24;
//     int minutes = difference.inMinutes % 60;
//     bool isArabic = Get.locale!.languageCode == 'ar';
//     if (days > 0) {
//       return isArabic ? "منذ $days يوم" : "$days days ago";
//     } else if (hours > 0) {
//       return isArabic ? "منذ $hours ساعة" : "$hours hours ago";
//     } else {
//       return isArabic ? "منذ $minutes دقيقة" : "$minutes minutes ago";
//     }
//   }

//   static Widget networkLoadingImageHandler(
//       BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
//     if (loadingProgress == null) return child;
//     return Center(
//       child: CircularProgressIndicator(
//         value: loadingProgress.expectedTotalBytes != null
//             ? loadingProgress.cumulativeBytesLoaded /
//                 loadingProgress.expectedTotalBytes!
//             : null,
//       ),
//     );
//   }

//   static pay() {
//     showModalBottomSheet(
//         context: Get.context!,
//         builder: (context) => PaymentScreen(),
//         isScrollControlled: false,
//         backgroundColor: AppColors.whiteColor,
//         showDragHandle: true);
//   }

String dateFormat(DateTime data) {
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  String formattedDate = formatter.format(data);
  return formattedDate;
}
//}
