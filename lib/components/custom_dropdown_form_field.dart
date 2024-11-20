// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

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
//       padding: EdgeInsets.zero,
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
