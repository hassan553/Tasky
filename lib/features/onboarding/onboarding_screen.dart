import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tt/components/custom_button.dart';
import 'package:tt/components/custom_image_handler.dart';
import 'package:tt/core/constants/app_consts.dart';
import 'package:tt/core/extension/navigation_extension.dart';
import 'package:tt/core/extension/text_extension.dart';
import 'package:tt/core/routes/app_pages.dart';
import 'package:tt/core/utils/app_colors.dart';
import 'package:tt/core/utils/app_images.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: CustomImageHandler(
              AppImages.onboarding,
              fit: BoxFit.fill,
              width: width(context),
            )),
            Text('Task Management &\nTo-Do List',
                textAlign: TextAlign.center,
                style: context.f12400!
                    .copyWith(fontSize: 24.sp, fontWeight: FontWeight.w700)),
            SizedBox(height: 16.h),
            Text(
                'This productive tool is designed to help\nyou better manage your task\n project-wise conveniently!',
                textAlign: TextAlign.center,
                style: context.f14400!.copyWith(color: AppColors.bgGrey)),
            SizedBox(height: 32.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: CustomButton(
                  text: 'Let\'s get started',
                  icon: Icons.arrow_forward_ios,
                  color: AppColors.whiteColor,
                  onTap: () =>
                      context.navigateToAndReplacement(AppPages.login)),
            ),
            SizedBox(height: 20.h)
          ],
        ),
      ),
    );
  }
}
