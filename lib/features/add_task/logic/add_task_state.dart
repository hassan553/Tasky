part of 'add_task_cubit.dart';

@immutable
sealed class AddTaskState {}

final class AddTaskInitial extends AddTaskState {}

class AddTaskSuccess extends AddTaskState {}

class AddTaskError extends AddTaskState {}

class AddTaskLoading extends AddTaskState {}

class ChangeImage extends AddTaskState {}

class ChangeImageLoading extends AddTaskState {}

class UploadImageTaskError extends AddTaskState {}

class UploadImageTaskLoading extends AddTaskState {}

class EditTaskSuccess extends AddTaskState {}

class EditTaskError extends AddTaskState {}

class EditTaskLoading extends AddTaskState {}
