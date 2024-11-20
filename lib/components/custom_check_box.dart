// import 'package:flutter/material.dart';
// import 'package:tt/core/utils/app_colors.dart';

// class CustomCheckbox extends StatelessWidget {
//   final bool value;
//   final ValueChanged<bool?> onChanged;

//   const CustomCheckbox({
//     Key? key,
//     required this.value,
//     required this.onChanged,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         onChanged(!value);
//       },
//       child: Container(
//         width: 24.0,
//         height: 24.0,
//         decoration: BoxDecoration(
//           color: value ? AppColors.primaryColor : Colors.white,
//           border: Border.all(
//             color: AppColors.primaryColor,
//           ),
//         ),
//         child: value
//             ? Center(
//                 child: Container(
//                   width: 14.0,
//                   height: 14.0,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.circle,
//                     border: Border.all(
//                       color: AppColors.primaryColor,
//                       style: BorderStyle.solid,
//                     ),
//                   ),
//                 ),
//               )
//             : null,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:tt/core/utils/app_colors.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CustomCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          color: value ? AppColors.primaryColor : Colors.white,
          border: Border.all(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(4.0), // Rounded corners
        ),
        child: value
            ? Icon(
                Icons.check,
                size: 18.0,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
