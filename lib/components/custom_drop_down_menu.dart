import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tt/core/extension/text_extension.dart';
import 'package:tt/core/utils/app_colors.dart';

class CustomDropdown extends StatefulWidget {
  final Function(String?)?
      onChanged; // Callback for when a new value is selected
  final String? initialValue; // Optional initial value

  const CustomDropdown({super.key, this.onChanged, this.initialValue});

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  // The selected value
  String? _selectedValue;

  // List of options
  final List<String> _dropdownItems = [
    'low',
    'medium',
    'high',
  ];

  @override
  void initState() {
    super.initState();
    // Set initial value if provided, otherwise set to the first item in the list
    _selectedValue = widget.initialValue ?? _dropdownItems[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.primaryColor.withOpacity(.2),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButton<String>(
        value: _selectedValue,
        underline: Container(),
        icon: Icon(
          Icons.arrow_drop_down,
          color: AppColors.primaryColor,
          size: 30.sp,
        ),
        isExpanded: true,
        onChanged: (newValue) {
          setState(() {
            _selectedValue = newValue;
          });
          // Trigger the onChanged callback if provided
          if (widget.onChanged != null) {
            widget.onChanged!(newValue);
          }
        },
        items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value,
                style: context.f15700!.copyWith(color: AppColors.primaryColor)),
          );
        }).toList(),
      ),
    );
  }
}
