// // ignore_for_file: must_be_immutable

// import 'package:alsooq/constants/app_strings.dart';
// import 'package:alsooq/enums/asnan_account_enum.dart';
// import 'package:alsooq/routes/app_routes.dart';
// import 'package:alsooq/services/account_controller_service.dart';
// import 'package:alsooq/utils/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// enum BottomNavBarSelectedScreen {
//   homeScreen,
//   myAppointmentsScreen,
//   myDoctorScreen,
//   moreScreen,
// }

// class BottomNavBar extends StatelessWidget {
//   BottomNavBar(
//       {super.key, this.separateIcons = true, required this.selectedScreen});

//   final bool separateIcons;
//   final BottomNavBarSelectedScreen selectedScreen;
//   final currentUser = Get.find<AccountControllerService>();

//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       child: LayoutBuilder(
//         builder: (context, constraints) => Row(
//           mainAxisAlignment: separateIcons
//               ? MainAxisAlignment.spaceBetween
//               : MainAxisAlignment.start,
//           children: [
//             Flexible(
//               flex: 5,
//               child: Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   BottomNavBarItem(
//                     onPress: () {
//                       if (selectedScreen !=
//                           BottomNavBarSelectedScreen.homeScreen) {
//                         if (currentUser.accountEnum ==
//                             AsnanAccountEnum.doctor) {
//                           Get.offAllNamed(AppRoutes.doctorHomeScreenRoute);
//                         } else {
//                           Get.offAllNamed(AppRoutes.userHomeScreenRoute);
//                         }
//                       }
//                     },
//                     icon: Icons.home,
//                     currentScreen: BottomNavBarSelectedScreen.homeScreen,
//                     selectedScreen: selectedScreen,
//                     title: AppStrings.home.tr,
//                   ),
//                   BottomNavBarItem(
//                     onPress: () {
//                       if (currentUser.accountEnum == AsnanAccountEnum.guest) {
//                         Get.offAllNamed(AppRoutes.signInScreenRoute);
//                       } else {
//                         if (selectedScreen !=
//                             BottomNavBarSelectedScreen.myAppointmentsScreen) {
//                           Get.offAllNamed(AppRoutes.appointmentsScreenRoute);
//                         }
//                       }
//                     },
//                     currentScreen:
//                         BottomNavBarSelectedScreen.myAppointmentsScreen,
//                     selectedScreen: selectedScreen,
//                     icon: Icons.assignment,
//                     title: AppStrings.appointments.tr,
//                   ),
//                 ],
//               ),
//             ),
//             Container(),
//             Flexible(
//               flex: 5,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   BottomNavBarItem(
//                     onPress: () {
//                       if (selectedScreen !=
//                           BottomNavBarSelectedScreen.myDoctorScreen) {
//                         if (currentUser.accountEnum == AsnanAccountEnum.guest) {
//                           Get.offAllNamed(AppRoutes.signInScreenRoute);
//                         } else if (currentUser.accountEnum ==
//                             AsnanAccountEnum.doctor) {
//                           Get.offAllNamed(AppRoutes.doctorPatientsScreenRoute);
//                         } else {
//                           Get.offAllNamed(AppRoutes.userDoctorsScreenRoute);
//                         }
//                       }
//                     },
//                     currentScreen: BottomNavBarSelectedScreen.myDoctorScreen,
//                     selectedScreen: selectedScreen,
//                     icon: currentUser.accountEnum == AsnanAccountEnum.doctor
//                         ? Icons.person
//                         : Icons.groups_2_outlined,
//                     title: currentUser.accountEnum == AsnanAccountEnum.doctor
//                         ? AppStrings.myPatients.tr
//                         : AppStrings.myDoctors.tr,
//                   ),
//                   BottomNavBarItem(
//                     onPress: () {
//                       if (selectedScreen !=
//                           BottomNavBarSelectedScreen.moreScreen) {
//                         if (currentUser.accountEnum == AsnanAccountEnum.guest) {
//                           Get.offAllNamed(AppRoutes.signInScreenRoute);
//                         } else
//                           Get.offAllNamed(AppRoutes.settingsScreenRoute);
//                       }
//                     },
//                     selectedScreen: selectedScreen,
//                     currentScreen: BottomNavBarSelectedScreen.moreScreen,
//                     icon: Icons.more_vert,
//                     title: AppStrings.more.tr,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BottomNavBarItem extends StatelessWidget {
//   const BottomNavBarItem({
//     super.key,
//     required this.onPress,
//     required this.icon,
//     required this.title,
//     required this.selectedScreen,
//     required this.currentScreen,
//   });
//   final Function onPress;
//   final IconData icon;
//   final String title;
//   final BottomNavBarSelectedScreen selectedScreen, currentScreen;

//   @override
//   Widget build(BuildContext context) {
//     Color colorState = (selectedScreen == currentScreen)
//         ? AppColors.primaryColor
//         : AppColors.greyColor;
//     return MaterialButton(
//       minWidth: MediaQuery.of(context).size.width * 0.08,
//       onPressed: () {
//         onPress();
//       },
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, color: colorState),
//           Text(
//             title,
//             style: TextStyle(
//               color: colorState,
//               fontSize: title.contains(' ') ? Get.width / 40 : Get.width / 27,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
