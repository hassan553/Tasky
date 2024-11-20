import 'package:flutter/material.dart';
import 'package:tt/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? color;
  final Color? bordereColor;
  final double? fontSize;
  final bool isDisabled;
  final IconData? icon;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.borderRadius = 6,
    this.backgroundColor = AppColors.primaryColor,
    this.color = AppColors.whiteColor,
    this.bordereColor = AppColors.primaryColor,
    this.fontSize = 20,
    this.isDisabled = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          // color: backgroundColor!,
          color: isDisabled ? AppColors.textInputBorderColor : backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius!),
          border: Border.all(
            color: isDisabled ? AppColors.textInputBorderColor : bordereColor!,
          ),
        ),
        child: Center(
          child: FittedBox(
            child: icon != null
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: color!,
                              fontSize: fontSize!,
                            ),
                      ),
                      const SizedBox(width: 10),
                      Icon(icon, color: color),
                    ],
                  )
                : Text(
                    text,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: color!,
                          fontSize: fontSize!,
                        ),
                  ),
          ),
        ),
      ),
    );
  }
}
