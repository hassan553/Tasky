import 'package:dartz/dartz.dart';
import 'package:tt/core/localization/app_strings.dart';
import 'package:tt/core/models/errors/exceptions.dart';
import 'package:tt/core/services/network_service/api_service.dart';
import 'package:tt/core/services/network_service/endpoints.dart';
import 'package:tt/features/home/data/model/task_model.dart';

class HomeRepo {
  DioImpl dio;
  HomeRepo({required this.dio});
  Future<Either<String, List<TaskModel>>> getAllTask(
      {required int currentPage}) async {
    try {
      var response = await dio.get(endPoint: EndPoints.allTask(currentPage));
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data as List<dynamic>;
        final tasks = data.map((item) => TaskModel.fromJson(item)).toList();
        return right(tasks);
      } else {
        return left(response.data['message']);
      }
    } on PrimaryServerException catch (e) {
      return left(e.message);
    } catch (e) {
      return left(AppStrings.processFailed);
    }
  }

  Future<Either<String, TaskModel>> deleteTask({required String taskId}) async {
    try {
      var response =
          await dio.delete(endPoint: EndPoints.allTask(int.parse(taskId)));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return right(TaskModel.fromJson(response.data));
      } else {
        return left(response.data['message']);
      }
    } on PrimaryServerException catch (e) {
      return left(e.message);
    } catch (e) {
      return left(AppStrings.processFailed);
    }
  }
}
