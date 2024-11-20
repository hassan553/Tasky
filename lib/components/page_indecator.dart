import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Color activeColor;
  final Color inactiveColor;

  PageIndicator({
    required this.currentPage,
    required this.totalPages,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages, (index) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 30.w,
              height: 30.h,
              decoration: BoxDecoration(
                  border: Border.all(color: activeColor),
                  shape: BoxShape.circle,
                  color: index < currentPage + 1 ? activeColor : inactiveColor),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    color: index < currentPage + 1
                        ? Colors.white
                        : activeColor.withOpacity(0.2),
                  ),
                ),
              ),
            ),
            if (index < totalPages - 1)
              Container(
                width: 0.16.sw,
                child: Divider(
                  color: index < currentPage
                      ? activeColor
                      : activeColor.withOpacity(0.2),
                  thickness: 2,
                ),
              ),
          ],
        );
      }),
    );
  }
}
