import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tt/components/custom_loader.dart';
import 'package:tt/core/extension/navigation_extension.dart';
import 'package:tt/core/routes/app_pages.dart';
import 'package:tt/core/services/setup/getIt.dart';
import 'package:tt/features/auth/logic/profile/profiel_cubit.dart';

import '../../data/repo/profile_repo.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileCubit(profileRepo: getIt<ProfileRepo>())..getUserProfile(),
      child: Scaffold(
        body: Center(
          child: BlocListener<ProfileCubit, ProfileState>(
            listener: (context, state) {
              if (state is GetUserProfileSuccess) {
                context.navigateToAndReplacement(AppPages.home);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomLoader(),
                SizedBox(height: 20.h),
                Text(
                  'Loading...',
                  style: TextStyle(fontSize: 20.sp),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
