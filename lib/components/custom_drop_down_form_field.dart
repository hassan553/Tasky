// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// // class CustomDropDownFormField extends StatelessWidget {
// //   const CustomDropDownFormField({
// //     super.key,
// //     required this.items,
// //     required this.onChanged,
// //     this.value,
// //     this.icon,
// //     this.hintText,
// //     this.validator,
// //   });

// //   final List<DropdownMenuItem>? items;
// //   final void Function(dynamic)? onChanged;
// //   final dynamic value;
// //   final Widget? icon;
// //   final String? hintText;
// //   final String? Function(dynamic)? validator;

// //   @override
// //   Widget build(BuildContext context) {
// //     return DropdownButtonFormField(
// //       items: items,
// //       style:   TextStyle(
// //     fontSize: 20.sp,
// //     color: AppColors.text300Color,
// //     fontWeight: FontWeight.w400,
// //   ),
// //       onChanged: onChanged,
// //       value: value,
// //       icon: icon,
// //       decoration: InputDecoration(
// //         contentPadding: const EdgeInsets.all(16),
// //         hintText: hintText,
// //         filled: true,
// //         fillColor: AppColors.textfieldBgColor,
// //         hintStyle: TextStyle(
// //     fontSize: 16.sp,
// //     color: AppColors.textfieldHintTxtColor,
// //     fontWeight: FontWeight.w400,
// //        ),
// //         errorStyle: TextStyle(
// //     fontSize: 16.sp,
// //     color: AppColors.redColor,
// //     fontWeight: FontWeight.w400,
// //   ),
// //         disabledBorder: OutlineInputBorder(
// //           borderSide: const BorderSide(
// //             color: AppColors.textfieldBorderColor,
// //           ),
// //           borderRadius: BorderRadius.all(
// //             Radius.circular(8.r),
// //           ),
// //         ),
// //         enabledBorder: OutlineInputBorder(
// //           borderSide: const BorderSide(
// //             color: AppColors.textfieldBorderColor,
// //           ),
// //           borderRadius: BorderRadius.all(
// //             Radius.circular(8.r),
// //           ),
// //         ),
// //         focusedBorder: OutlineInputBorder(
// //           borderSide: const BorderSide(
// //             color: AppColors.textfieldBorderColor,
// //           ),
// //           borderRadius: BorderRadius.all(
// //             Radius.circular(8.r),
// //           ),
// //         ),
// //         border: OutlineInputBorder(
// //           borderSide: const BorderSide(
// //             color: AppColors.textfieldBorderColor,
// //           ),
// //           borderRadius: BorderRadius.all(
// //             Radius.circular(8.r),
// //           ),
// //         ),
// //       ),
// //       validator: validator,
// //     );
// //   }
// // }

// class CustomDropDownFormField extends StatelessWidget {
//   const CustomDropDownFormField(
//       {super.key,
//       required this.items,
//       required this.onChanged,
//       this.value,
//       this.icon,
//       this.hintText,
//       this.validator,
//       this.color});

//   final List<DropdownMenuItem>? items;
//   final void Function(dynamic)? onChanged;
//   final dynamic value;
//   final Widget? icon;
//   final String? hintText;
//   final String? Function(dynamic)? validator;
//   final Color? color;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField(
//       items: items,
//       style: Get.textTheme.bodySmall,
//       onChanged: onChanged,
//       value: value,
//       icon: icon,
//       decoration: InputDecoration(
//         hintText: hintText,
//         filled: true,
//         fillColor: color ?? Colors.white,
//         hintStyle: TextStyle(
//           fontSize: 16.0,
//           color: Colors.grey,
//           fontWeight: FontWeight.w400,
//         ),
//         errorStyle: TextStyle(
//           fontSize: 16.0,
//           color: Colors.red,
//           fontWeight: FontWeight.w400,
//         ),
//         disabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(
//             color: Colors.grey,
//           ),
//           borderRadius: BorderRadius.all(
//             Radius.circular(8.0),
//           ),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(
//             color: Colors.grey,
//           ),
//           borderRadius: BorderRadius.all(
//             Radius.circular(8.0),
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: const BorderSide(
//             color: Colors.grey,
//           ),
//           borderRadius: BorderRadius.all(
//             Radius.circular(8.0),
//           ),
//         ),
//         border: OutlineInputBorder(
//           borderSide: const BorderSide(
//             color: Colors.grey,
//           ),
//           borderRadius: BorderRadius.all(
//             Radius.circular(8.0),
//           ),
//         ),
//       ),
//       validator: validator,
//     );
//   }
// }
