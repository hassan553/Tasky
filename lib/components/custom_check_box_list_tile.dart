import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tt/components/custom_check_box.dart';

class CustomCheckboxListTile extends StatefulWidget {
  final Widget title;
  final bool isChecked;
  final ValueChanged<bool?> onChanged;

  const CustomCheckboxListTile({
    Key? key,
    required this.title,
    required this.isChecked,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomCheckboxListTile> createState() => _CustomCheckboxListTileState();
}

class _CustomCheckboxListTileState extends State<CustomCheckboxListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0), // Optional: add padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          widget.title,
          16.horizontalSpace, // Text widget (title)
          CustomCheckbox(
            value: widget.isChecked,
            onChanged: (c) {
              widget.onChanged(c);
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
