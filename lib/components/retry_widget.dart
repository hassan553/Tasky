// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:tt/core/constants/app_images_path.dart';
// import 'package:tt/core/utils/app_colors.dart';

// class RetryWidget extends StatelessWidget {
//   final Function onRetry;
//   final String msg;

//   const RetryWidget({
//     super.key,
//     required this.onRetry,
//     this.msg = 'حدث خطأ ما',
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         SvgPicture.asset(AppImages.error),
//         SizedBox(height: 15),
//         ElevatedButton.icon(
//           onPressed: () async {
//             await onRetry();
//           },
//           label: Text(
//             msg,
//             style: TextStyle(color: AppColors.whiteColor, fontSize: 18.sp),
//           ),
//           style: ButtonStyle(
//             padding: WidgetStatePropertyAll(
//               EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
//             ),
//           ),
//           icon: Icon(
//             Icons.refresh,
//             color: AppColors.whiteColor,
//           ),
//         ),
//       ],
//     );
//   }
// }
