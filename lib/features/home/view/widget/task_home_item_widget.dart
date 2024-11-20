import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tt/components/custom_image_handler.dart';
import 'package:tt/features/home/logic/home_cubit.dart';
import 'package:tt/features/home/view/widget/show_info_bubble_dailog.dart';

import '../../../../core/utils/app_functions.dart';
import '../../../../core/utils/app_images.dart';
import '../../data/model/task_model.dart';

class TaskItemCard extends StatelessWidget {
  final TaskModel? task;
  const TaskItemCard({super.key, this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: CustomImageHandler(
              task?.image ?? AppImages.onboarding,
              height: 60.h,
              width: 60.h,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          // Content Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // App Name and Status
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      task?.title ?? "",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.red.shade100,
                      ),
                      child: Text(
                        task?.status ?? "",
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                // Description
                Text(
                  task?.desc ?? "",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                // Flag and Date
                Row(
                  children: [
                    const Icon(Icons.flag, color: Colors.purple, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      task?.priority ?? "",
                      style: const TextStyle(
                        color: Colors.purple,
                        fontSize: 14,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      dateFormat(DateTime.parse(task!.createdAt!)),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => CustomInfoDialog(taskId: task!.sId!),
                );
              },
              child: Icon(Icons.more_vert_sharp, size: 25.sp))
        ],
      ),
    );
  }
}
