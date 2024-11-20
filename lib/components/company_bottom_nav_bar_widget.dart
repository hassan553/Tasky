// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import 'package:get/get.dart';
// import 'package:tt/core/constants/app_images_path.dart';
// import 'package:tt/core/utils/app_colors.dart';
// import 'package:tt/routes/app_routes.dart';

// BottomNavigationBar buildCompanyBottomNavBarWidget(int currentIndex) {
//   return BottomNavigationBar(
//     currentIndex: currentIndex,
//     onTap: (index) {
//       switch (index) {
//         case 0:
//           Get.offNamed(Routes.homeCompany);
//           break;
//         case 1:
//           Get.offNamed(Routes.chatList);
//           break;
//         case 2:
//           // Get.offNamed(Routes.home);
//           break;
//       }
//     },
//     showUnselectedLabels: true,
//     selectedFontSize: 12,
//     unselectedFontSize: 12,
//     iconSize: 20,
//     unselectedItemColor: AppColors.offWhite,
//     selectedItemColor: AppColors.primaryColor,
//     items: [
//       BottomNavigationBarItem(
//         icon: SvgPicture.asset(AppImages.teacher,
//             colorFilter: ColorFilter.mode(
//                 currentIndex == 0 ? AppColors.primaryColor : AppColors.offWhite,
//                 BlendMode.srcIn)),
//         label: 'عروضي',
//       ),
//       BottomNavigationBarItem(
//         icon: SvgPicture.asset(AppImages.chat,
//             colorFilter: ColorFilter.mode(
//               currentIndex == 1 ? AppColors.primaryColor : AppColors.offWhite,
//               BlendMode.srcIn,
//             )),
//         label: 'الرسائل',
//       ),
//       BottomNavigationBarItem(
//         icon: SvgPicture.asset(AppImages.userCircle,
//             colorFilter: ColorFilter.mode(
//               currentIndex == 2 ? AppColors.primaryColor : AppColors.offWhite,
//               BlendMode.srcIn,
//             )),
//         label: 'حسابي',
//       )
//     ],
//   );
// }
