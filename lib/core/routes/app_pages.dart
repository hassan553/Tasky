import 'package:flutter/material.dart';
import 'package:tt/features/add_task/views/screens/add_task_screen.dart';
import 'package:tt/features/auth/view/screen/loading_page.dart';
import 'package:tt/features/home/view/screen/task_details_screen.dart';
import 'package:tt/features/onboarding/onboarding_screen.dart';
import 'package:tt/features/profile/views/screens/profile_screen.dart';

import '../../features/auth/view/screen/login_screen.dart';
import '../../features/auth/view/screen/register_screen.dart';
import '../../features/home/view/screen/home_screen.dart';

class AppPages {
  static const onboarding = '/';
  static const register = '/register';
  static const login = '/login';
  static const loadingPage = '/loadingPage';
  static const home = '/home';
  static const profile = '/profile';
  static const addTask = '/addTask';
  static const taskDetails = '/taskDetails';
}

Map<String, Widget Function(BuildContext)> routes = {
  AppPages.onboarding: (context) => const OnboardingScreen(),
  AppPages.register: (context) => const RegisterScreen(),
  AppPages.login: (context) => const LoginScreen(),
  AppPages.loadingPage: (context) => const LoadingPage(),
  AppPages.home: (context) => const HomeScreen(),
  AppPages.profile: (context) => const ProfileScreen(),
  AppPages.addTask: (context) => const AddTaskScreen(),
  AppPages.taskDetails: (context) => const TaskDetailsScreen(),
};
