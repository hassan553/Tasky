import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tt/core/extension/text_extension.dart';
import 'package:tt/core/services/setup/getIt.dart';
import 'package:tt/features/auth/data/repo/profile_repo.dart';
import 'package:tt/features/auth/logic/profile/profiel_cubit.dart';
import 'package:tt/features/profile/data/model/profile_item_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileCubit(profileRepo: getIt<ProfileRepo>())..getUserProfile(),
      child: Scaffold(
          appBar: AppBar(
            title: Text('Profile', style: context.f16700),
          ),
          body: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              return ListView.separated(
                  itemBuilder: (itemBuilder, index) {
                    var cubit = context.read<ProfileCubit>();
                    return ProfileItemWidget(
                        profileItem: cubit.profileItems[index]);
                  },
                  separatorBuilder: (separatorBuilder, index) =>
                      SizedBox(height: 10.h),
                  itemCount: context.read<ProfileCubit>().profileItems.length);
            },
          )),
    );
  }
}

class ProfileItemWidget extends StatelessWidget {
  final ProfileItemModel profileItem;
  const ProfileItemWidget({super.key, required this.profileItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xffF5F5F5),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              profileItem.title,
              style: context.f12500!.copyWith(
                color: const Color(0xff2F2F2F).withOpacity(.4),
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              profileItem.value,
              style: context.f18700!.copyWith(
                color: const Color(0xff2F2F2F).withOpacity(.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
