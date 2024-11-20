// // ignore_for_file: must_be_immutable

// import 'package:alsooq/components/buttons/language_button.dart';
// import 'package:alsooq/localization/language_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class LanguageMultiButton extends GetView<LanguageController> {
//   LanguageMultiButton({
//     super.key,
//     this.onLanguageTranslate,
//   });

//   late Function? onLanguageTranslate;

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.ltr,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
//             child: LanguageButton(
//               height: 25,
//               image: const AssetImage(
//                ' AppImages.egyptFlagPath',
//                 package: 'country_icons',
//               ),
//               onPress: () {
//                 controller.changeLanguage('ar');
//                 if (onLanguageTranslate != null) {
//                   onLanguageTranslate!();
//                 }
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(5, 10, 10, 10),
//             child: LanguageButton(
//               height: 25,
//               image: const AssetImage(
//               '  AppImages.englandFlagPath',
//                 package: 'country_icons',
//               ),
//               onPress: () {
//                 controller.changeLanguage('en');
//                 if (onLanguageTranslate != null) {
//                   onLanguageTranslate!();
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
