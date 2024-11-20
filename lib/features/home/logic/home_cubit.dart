import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tt/features/home/data/repo/home_repo.dart';

import '../data/model/task_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepo repo;
  HomeCubit({required this.repo}) : super(HomeInitial()) {
    scrollController.addListener(addListen);
  }
 static HomeCubit get(context) => BlocProvider.of(context);
  List<TaskModel> tasks = [];
  int currentPage = 1;
  Future<void> getAllTask([bool? isPagination]) async {
    if (isPagination == null) {
      emit(GetAllTaskLoading());
    } else {
      emit(GetAllPaginationTaskLoading());
    }

    final result = await repo.getAllTask(currentPage: currentPage);
    result.fold(
      (l) => emit(GetAllTaskFailed(l)),
      (r) {
        currentPage++;
        tasks.addAll(r);
        print(currentPage++);
        emit(GetAllTaskSuccess(r));
      },
    );
  }

  ScrollController scrollController = ScrollController();
  addListen() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      await getAllTask(true);
    }
  }

  Future<void> deleteTask({required String taskId}) async {
    emit(DeleteTaskLoading());
    final result = await repo.deleteTask(taskId: taskId);
    result.fold(
      (l) => emit(DeleteTaskFailed(l)),
      (r) {
       // tasks.removeWhere((element) => element.sId == taskId.toString());
        emit(DeleteTaskSuccess());
      },
    );
  }
}
