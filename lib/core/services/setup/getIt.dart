import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:tt/core/services/network_service/api_service.dart';
import 'package:tt/features/add_task/data/repo/add_task_repo.dart';
import 'package:tt/features/auth/data/repo/Register_repo.dart';
import 'package:tt/features/auth/data/repo/profile_repo.dart';
import 'package:tt/features/home/data/repo/home_repo.dart';

import '../../../features/auth/data/repo/login_repo.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<DioImpl>(() => DioImpl());
  getIt
      .registerLazySingleton<LoginRepo>(() => LoginRepo(dio: getIt<DioImpl>()));
  getIt.registerLazySingleton<ProfileRepo>(
      () => ProfileRepo(dio: getIt<DioImpl>()));
  getIt.registerLazySingleton<RegisterRepo>(
      () => RegisterRepo(dio: getIt<DioImpl>()));
  getIt.registerLazySingleton<AddTaskRepo>(
      () => AddTaskRepo(dio: getIt<DioImpl>()));
       getIt.registerLazySingleton<HomeRepo>(
      () => HomeRepo(dio: getIt<DioImpl>()));
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
}

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }
}
