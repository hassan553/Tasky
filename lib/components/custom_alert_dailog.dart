// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tt/components/text_field_component.dart';
// import 'package:tt/core/utils/app_colors.dart';

// customAlertDailog({
//   String? title,
//   String? buttonText1,
//   String? buttonText2,
//   void Function()? onTap,
//   bool? withTxtFiled,
//   dynamic Function(String?)? onchange,
// }) {
//   Get.dialog(
//     AlertDialog(
//       title: Text(title ?? ''),
//       actionsAlignment: MainAxisAlignment.center,
//       content: withTxtFiled != null
//           ? TextFieldComponent(
//               hint: 'Enter Password',
//               onChange: onchange,
//               hasShowPasswordIcon: true,
//             )
//           : null,
//       actions: [
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: AppColors.whiteColor,
//             border: Border.all(color: AppColors.redColor),
//           ),
//           height: Get.height / 18,
//           width: Get.width * .27,
//           child: InkWell(
//             onTap: () {
//               Get.back();
//             },
//             child: Center(
//               child: Text(
//                 buttonText2 ?? '',
//                 maxLines: 1,
//                 style: TextStyle(color: AppColors.redColor),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: Get.height / 18,
//           width: Get.width * .27,
//           child: ElevatedButton(
//             style: ButtonStyle(
//               backgroundColor: WidgetStatePropertyAll(AppColors.redColor),
//             ),
//             onPressed: onTap,
//             child: FittedBox(child: Text(buttonText1 ?? '')),
//           ),
//         ),
//       ],
//     ),
//   );
// }
