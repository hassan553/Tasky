import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tt/components/custom_image_handler.dart';
import 'package:tt/core/extension/text_extension.dart';

class DottedBorderIcon extends StatelessWidget {
  final String icon;
  final double size;
  final Color borderColor;
  final Color iconColor;
  final String? image;
  final void Function()? onTap;
  const DottedBorderIcon({
    super.key,
    required this.icon,
    this.size = 100,
    this.onTap,
    this.image,
    this.borderColor = Colors.blue,
    this.iconColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DottedBorder(
        color: borderColor,
        strokeWidth: 1,
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        dashPattern: const [6, 3],
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Center(
          child: image != null
              ? Image.file(
                  File(image!),
                  fit: BoxFit.fill,
                  height: 50.h,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageHandler(
                      icon,
                      width: size,
                      fit: BoxFit.fill,
                      color: iconColor,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'Add Image',
                      style: context.f15600!.copyWith(color: Colors.blue),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
