// import 'package:flutter/material.dart';
// import 'package:quickalert/models/quickalert_type.dart';
// import 'package:quickalert/widgets/quickalert_dialog.dart';

// class SuccessAlert extends StatelessWidget {
//   const SuccessAlert({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final successAlert = buildButton(
//       onTap: () {
//         QuickAlert.show(
//           context: context,
//           type: QuickAlertType.success,
//           text: 'Transaction Completed Successfully!',
//           autoCloseDuration: const Duration(seconds: 2),
//           showConfirmBtn: false,
//         );
//       },
//       title: 'Success',
//       text: 'Transaction Completed Successfully!',
//       leadingImage: 'assets/success.gif',
//     );
//     return const Placeholder();
//   }

//   Card buildButton({
//     required onTap,
//     required title,
//     required text,
//     required leadingImage,
//   }) {
//     return Card(
//       shape: const StadiumBorder(),
//       margin: const EdgeInsets.symmetric(
//         horizontal: 20,
//       ),
//       clipBehavior: Clip.antiAlias,
//       elevation: 1,
//       child: ListTile(
//         onTap: onTap,
//         leading: CircleAvatar(
//           backgroundImage: AssetImage(
//             leadingImage,
//           ),
//         ),
//         title: Text(title ?? ""),
//         subtitle: Text(text ?? ""),
//         trailing: const Icon(
//           Icons.keyboard_arrow_right_rounded,
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:tt/components/custom_button.dart';
// import 'package:tt/core/utils/app_colors.dart';

// class SuccessDialog extends StatelessWidget {
//   final String orderId;

//   const SuccessDialog({super.key, required this.orderId});

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.r),
//       ),
//       child: Padding(
//         padding: EdgeInsets.all(16.sp),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SizedBox(height: 10.h),
//             Icon(
//               Icons.check_circle,
//               color: Colors.blue,
//               size: 50.sp,
//             ),
//             SizedBox(height: 20.h),
//             Text(
//               'تم إضافة الطلب رقم',
//               style: TextStyle(
//                 fontSize: 18.sp,
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 5.h),
//             Text(
//               '#$orderId',
//               style: TextStyle(
//                 fontSize: 18.sp,
//                 color: Colors.blue,
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 10.h),
//             Text(
//               'سوف تسهيل عروض أسعار الخدمة المطلوبة\nخلال 30 دقيقة من الآن',
//               style: TextStyle(
//                 fontSize: 14.sp,
//                 color: Colors.grey,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20.h),
//             CustomButton(
//                 text: ' حسنا',
//                 onTap: () {
//                   Get.back();
//                 },
//                 color: AppColors.whiteColor),
//           ],
//         ),
//       ),
//     );
//   }
// }
