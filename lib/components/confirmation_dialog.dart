// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tt/core/localization/app_strings.dart';

// class ConfirmationAlertDialog extends StatelessWidget {
//   const ConfirmationAlertDialog({
//     super.key,
//     required this.content,
//     required this.onConfirm,
//   });

//   final String content;
//   final Function onConfirm;

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       icon: Icon(
//         Icons.check_circle,
//         color: Get.theme.primaryColor,
//         size: 50,
//       ),
//       title: Text(content, style: Get.textTheme.bodyMedium),
//       // contentTextStyle: ,
//       actions: [
//         SizedBox(
//           height: Get.height / 18,
//           width: Get.width,
//           child: ElevatedButton(
//             onPressed: () => onConfirm(),
//             child: Text(AppStrings.confirm.tr),
//           ),
//         ),
//       ],
//     );
//   }
// }
