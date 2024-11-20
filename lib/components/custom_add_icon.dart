import 'package:flutter/material.dart';
import '../core/utils/app_colors.dart';

class CustomAddIcon extends StatelessWidget {
  final Function()? onTap;
  const CustomAddIcon({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: AppColors.secondaryColor.withOpacity(.2),
        child: const Icon(Icons.add),
      ),
    );
  }
}
