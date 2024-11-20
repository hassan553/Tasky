// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tt/core/utils/app_colors.dart';

// // ignore: must_be_immutable
// class CustomAppBar extends StatelessWidget {
//   CustomAppBar(
//       {super.key, required this.title, this.isClose = true, this.onback});
//   final String title;
//   bool isClose = true;
//   final Function? onback;
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: AppColors.primaryColor,
//         actions: isClose
//             ? [
//                 IconButton(
//                   onPressed: () {
//                     (onback != null) ? onback!() : Get.back();
//                   },
//                   icon: const Icon(
//                     Icons.close,
//                     color: AppColors.whiteColor,
//                   ),
//                 )
//               ]
//             : null,
//         title: Text(title,
//             style: Get.textTheme.headlineMedium!
//                 .copyWith(color: AppColors.whiteColor)),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back,
//             color: AppColors.whiteColor,
//           ),
//         ));
//   }
// }
