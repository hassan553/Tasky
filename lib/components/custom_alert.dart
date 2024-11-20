import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tt/components/custom_button.dart';

void showCustomAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'أضف اسم لهذا العنوان',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Text(
              'GHJ+785550584846445, أم صلال، قطر',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0, color: Colors.grey),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'الشغل',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(text: 'إلغاء', onTap: () {}),
                CustomButton(text: 'إضافة', onTap: () {}),
              ],
            ),
          ],
        ),
      );
    },
  );
}
