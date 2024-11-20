import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tt/components/custom_image_handler.dart';
import 'package:tt/core/constants/app_consts.dart';
import 'package:tt/core/extension/text_extension.dart';
import 'package:tt/core/utils/app_colors.dart';
import 'package:tt/core/utils/app_images.dart';
import 'package:tt/features/home/data/model/task_model.dart';

import '../../../../core/utils/app_functions.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  TaskModel? task;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    task = ModalRoute.of(context)?.settings.arguments as TaskModel;
    return Scaffold(
      appBar: AppBar(title: Text(task?.title ?? '', style: context.f16700)),
      body: ListView(
        children: [
          CustomImageHandler(
            task?.image ?? AppImages.onboarding,
            fit: BoxFit.cover,
            height: height(context) * .3,
            width: width(context),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task?.title ?? '', style: context.f20400),
                const SizedBox(height: 4),
                Text(task?.desc ?? '',
                    style: context.f14400!.copyWith(
                        color: const Color(0xff24252C).withOpacity(.6))),
                const SizedBox(height: 16),
                DisplayDateWidget(
                    date: dateFormat(DateTime.parse(task!.createdAt!))),
                const SizedBox(height: 8),
                DisplayStatusWidget(status: task?.status ?? ''),
                const SizedBox(height: 8),
                DisplayPriorityWidget(status: task?.priority ?? ''),
                const SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DisplayPriorityWidget extends StatelessWidget {
  final String status;
  const DisplayPriorityWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xffF0ECFF),
        ),
        padding: const EdgeInsets.all(12),
        child: Row(children: [
          Text(status,
              style: context.f18700!.copyWith(color: AppColors.primaryColor)),
          const Spacer(),
          Icon(Icons.arrow_drop_down,
              size: 30.sp, color: AppColors.primaryColor)
        ]));
  }
}

class DisplayStatusWidget extends StatelessWidget {
  final String status;
  const DisplayStatusWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xffF0ECFF),
        ),
        padding: const EdgeInsets.all(12),
        child: Row(children: [
          Text(
            status,
            style: context.f18700!.copyWith(color: AppColors.primaryColor),
          ),
          const Spacer(),
          Icon(Icons.arrow_drop_down,
              size: 30.sp, color: AppColors.primaryColor)
        ]));
  }
}

class DisplayDateWidget extends StatelessWidget {
  final String date;
  const DisplayDateWidget({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xffF0ECFF),
        ),
        padding: const EdgeInsets.all(12),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('End date',
                    style: context.f9400!
                        .copyWith(color: const Color(0xff6E6A7C))),
                const SizedBox(height: 2),
                Text(date,
                    style: context.f14400!
                        .copyWith(color: const Color(0xff24252C))),
              ],
            ),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.date_range_sharp, color: AppColors.primaryColor),
        ]));
  }
}
