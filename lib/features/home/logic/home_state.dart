part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetAllTaskLoading extends HomeState {}

final class GetAllTaskSuccess extends HomeState {
  final List<TaskModel> tasks;
  GetAllTaskSuccess(this.tasks);
}

final class GetAllTaskFailed extends HomeState {
  final String message;
  GetAllTaskFailed(this.message);
}
final class GetAllPaginationTaskLoading extends HomeState {}
final class DeleteTaskLoading extends HomeState {}

final class DeleteTaskSuccess extends HomeState {}

final class DeleteTaskFailed extends HomeState {
  final String message;
  DeleteTaskFailed(this.message);
}
