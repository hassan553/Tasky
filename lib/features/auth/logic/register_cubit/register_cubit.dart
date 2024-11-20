import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tt/features/auth/data/repo/Register_repo.dart';

import '../../../../components/custom_toast.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  static RegisterCubit get(context) => BlocProvider.of(context);
  RegisterRepo registerRepo;

  RegisterCubit({required this.registerRepo}) : super(RegisterInitial());

  void register({
    required TextEditingController phoneController,
    required TextEditingController passwordController,
    required TextEditingController displayNameController,
    required TextEditingController experienceYearsController,
    required TextEditingController addressController,
    required TextEditingController levelController,
  }) async {
    emit(RegisterLoading());
    var result = await registerRepo.register(
      phone: phoneController.text.trim(),
      password: passwordController.text.trim(),
      displayName: displayNameController.text.trim(),
      experienceYears: experienceYearsController.text.trim(),
      address: addressController.text.trim(),
      level: levelController.text.trim(),
    );
    result.fold((error) {
      showToast(msg: error, isError: true);
      emit(RegisterError());
    }, (_) {
      emit(RegisterSuccess());
    });
  }
}
