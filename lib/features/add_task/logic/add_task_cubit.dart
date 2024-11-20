import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tt/components/custom_toast.dart';
import 'package:tt/features/add_task/data/repo/add_task_repo.dart';

import '../../../core/utils/app_functions.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskRepo addTaskRepo;
  AddTaskCubit({required this.addTaskRepo}) : super(AddTaskInitial());
  static AddTaskCubit get(context) => BlocProvider.of(context);
  Future<void> addTask({
    required String imagea,
    required String title,
    required String desc,
    required String priority,
    required String dueDate,
  }) async {
    emit(AddTaskLoading());
    var response = await addTaskRepo.addTask(
      image: imagea,
      title: title,
      desc: desc,
      priority: priority,
      dueDate: dueDate,
    );
    response.fold(
      (l) {
        showToast(msg: l, isError: true);
        emit(AddTaskError());
      },
      (r) {
        showToast(msg: r, isError: false);
        emit(AddTaskSuccess());
      },
    );
  }

  Future<void> editTask({
    required String image,
    required String title,
    required String desc,
    required String priority,
    required String dueDate,
    required String status,
    required String id,
  }) async {
    emit(EditTaskLoading());
    var response = await addTaskRepo.editTask(
      image: image,
      title: title,
      desc: desc,
      priority: priority,
      dueDate: dueDate,
      status: status,
      taskId: id,
    );
    response.fold(
      (l) {
        showToast(msg: l, isError: true);
        emit(EditTaskError());
      },
      (r) {
        showToast(msg: r, isError: false);
        emit(EditTaskSuccess());
      },
    );
  }

  Future<void> uploadImage({
    required String image,
    required String title,
    required String desc,
    required String priority,
    required String dueDate,
  }) async {
    emit(UploadImageTaskLoading());
    var response = await addTaskRepo.uploadImage(image: imageFile!);
    response.fold(
      (l) {
        showToast(msg: l, isError: true);
        emit(UploadImageTaskError());
      },
      (r) async {
        await addTask(
            imagea: r,
            title: title,
            desc: desc,
            priority: priority,
            dueDate: dueDate);
      },
    );
  }

  String? image;
  File? imageFile;
  takeTaskImage() async {
    emit(ChangeImageLoading());
    var image2 = pickImageFromGallery();
    if (image2 != null) {
      image = await image2;
      imageFile = File(image!);
    }
    emit(ChangeImage());
  }
}
