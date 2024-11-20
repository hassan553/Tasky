import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tt/core/routes/app_pages.dart';
import 'package:tt/features/auth/data/repo/login_repo.dart';
import 'package:tt/features/onboarding/onboarding_screen.dart';

import '../../../../components/custom_toast.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  static LoginCubit get(context) => BlocProvider.of(context);
  LoginRepo loginRepo;
  LoginCubit({required this.loginRepo}) : super(LoginInitial());

  void login({
    required String phone,
    required String password,
  }) async {
    emit(LoginSuccess());
    var result = await loginRepo.login(phone: phone, password: password);
    result.fold((error) {
      showToast(msg: error, isError: true);
      emit(LoginError());
    }, (_) async {
      showToast(msg: 'login successfully');
      emit(LoginSuccess());
    });
  }
}
