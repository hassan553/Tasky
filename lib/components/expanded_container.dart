// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tt/core/utils/app_colors.dart';

// class ExpandedContainer extends StatefulWidget {
//   ExpandedContainer({
//     super.key,
//     required this.title,
//     required this.expandedChildren,
//     this.outerPadding,
//   }) {
//     outerPadding = outerPadding ?? const EdgeInsets.only(top: 10);
//   }

//   final String title;
//   final List<Widget> expandedChildren;
//   late EdgeInsets? outerPadding;

//   @override
//   State<ExpandedContainer> createState() => _ExpandedContainerState();
// }

// class _ExpandedContainerState extends State<ExpandedContainer> {
//   bool isExpanded = false;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: widget.outerPadding!,
//       child: Container(
//         width: Get.width,
//         padding: const EdgeInsets.only(left: 10, right: 10),
//         color: AppColors.whiteColor,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 15, bottom: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     widget.title,
//                     style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                         ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       setState(() {
//                         isExpanded = !isExpanded;
//                       });
//                     },
//                     child: Icon(
//                       isExpanded
//                           ? Icons.keyboard_arrow_up
//                           : Icons.keyboard_arrow_down,
//                       color: AppColors.primaryColor,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             if (isExpanded) ...widget.expandedChildren
//           ],
//         ),
//       ),
//     );
//   }
// }
