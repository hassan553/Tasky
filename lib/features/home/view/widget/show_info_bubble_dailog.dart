import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../logic/home_cubit.dart';

class CustomInfoDialog extends StatelessWidget {
  final String taskId;
  const CustomInfoDialog({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 30),
                const Text(
                  'Are you sure?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Are you sure you want to delete this item?',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          return ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(AppColors.greenColor),
                            ),
                            onPressed: () {
                              HomeCubit.get(context).deleteTask(taskId: taskId);
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'ok',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: -40,
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 35.r,
              child: const Icon(Icons.info, size: 40, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
