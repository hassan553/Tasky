// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tt/core/utils/app_colors.dart';

// class IconWithLableWidget extends StatelessWidget {
//   const IconWithLableWidget({
//     super.key,
//     required this.title,
//     required this.icon,
//     this.hasborder = false,
//     this.content = '',
//     this.titlecolor,
//   });

//   final String title, content;
//   final Icon icon;
//   final Color? titlecolor;
//   final bool hasborder;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: hasborder ? EdgeInsets.zero : const EdgeInsets.only(top: 10),
//       child: Row(
//         children: [
//           hasborder
//               ? Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: AppColors.primaryColor,
//                     ),
//                   ),
//                   padding: const EdgeInsets.all(10),
//                   child: icon,
//                 )
//               : Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: icon,
//                 ),
//           hasborder
//               ? Expanded(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: AppColors.primaryColor,
//                       ),
//                     ),
//                     padding: const EdgeInsets.all(9),
//                     child: Row(
//                       children: [
//                         content == ''
//                             ? Flexible(
//                                 child: Text(title,
//                                     overflow: TextOverflow.ellipsis,
//                                     maxLines: 1,
//                                     style: Get.textTheme.headlineSmall),
//                               )
//                             : Text(title,
//                                 overflow: TextOverflow.ellipsis,
//                                 maxLines: 1,
//                                 style: Get.textTheme.headlineSmall),
//                         if (content != '')
//                           Flexible(
//                             child: Text(content,
//                                 overflow: TextOverflow.ellipsis,
//                                 maxLines: 1,
//                                 style: Get.textTheme.headlineSmall),
//                           ),
//                       ],
//                     ),
//                   ),
//                 )
//               : Expanded(
//                   child: Text(title,
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 1,
//                       style: Get.textTheme.headlineSmall),
//                 ),
//         ],
//       ),
//     );
//   }
// }
