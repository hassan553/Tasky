// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tt/components/custom_button.dart';
// import 'package:tt/core/localization/app_strings.dart';
// import 'package:tt/core/utils/app_colors.dart';

// class ErrorDialog extends StatelessWidget {
//   const ErrorDialog({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Icon(
//         Icons.warning_amber_rounded,
//         color: AppColors.redAlertColor,
//         size: 90,
//       ),
//       content: Text(
//         AppStrings.someThingWentWrong.tr,
//         textAlign: TextAlign.center,
//         style: Get.textTheme.bodyLarge,
//       ),
//       actions: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Expanded(
//               child: CustomButton(
//                 text: AppStrings.ok.tr,
//                 onTap: () {
//                   Get.back();
//                 },
//               ),
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }
