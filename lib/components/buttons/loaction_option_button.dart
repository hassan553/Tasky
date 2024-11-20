import 'package:flutter/material.dart';

import 'package:tt/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoactionButton extends StatelessWidget {
  const LoactionButton({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle = "",
    required this.onTab,
  });
  final Function onTab;
  final String title, subtitle, icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTab();
      },
      child: Container(
          width: 353.w,
          height: 60.h,
          margin: EdgeInsets.symmetric(vertical: 4.h),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              children: [
                SvgPicture.asset(
                  icon,
                  height: 40.sp,
                ),
                5.horizontalSpace,
                Text(title),
              ],
            ),
          )),
    );
  }
}
