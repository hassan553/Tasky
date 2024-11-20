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
  List<TaskModel> allTasks = [];
  List<TaskModel> inProgressTasks = [];
  List<TaskModel> completedTasks = [];
  List<TaskModel> waitingTasks = [];
  List<TaskModel> getSelectedTasks(int index) {
    if (index == 0) {
      return allTasks;
    } else if (index == 1) {
      return inProgressTasks;
    } else if (index == 2) {
      return completedTasks;
    } else {
      return waitingTasks;
    }
  }

  int currentIndex = 0;

  void changeIndex(int index) {
    emit(ChangeLoadingTaskState());
    currentIndex = index;
    emit(ChangeIndexState());
  }

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
        allTasks.addAll(r);
        assignTasks();
        emit(GetAllTaskSuccess(r));
      },
    );
  }

  List<String> titles = ['All', 'Inpogress', 'Waiting', 'Finished'];

  void assignTasks() {
    inProgressTasks =
        allTasks.where((element) => element.status == 'inProgress').toList();
    completedTasks =
        allTasks.where((element) => element.status == 'completed').toList();
    waitingTasks =
        allTasks.where((element) => element.status == 'waiting').toList();
    emit(ChangeLoadingTaskState());
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
