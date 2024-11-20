import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tt/core/localization/app_strings.dart';
import 'package:tt/core/models/errors/exceptions.dart';
import 'package:tt/core/services/network_service/api_service.dart';
import 'package:dio/src/multipart_file.dart' as multipart_file;
import '../../../../core/services/network_service/endpoints.dart';
import 'package:dio/dio.dart' as d;

class AddTaskRepo {
  DioImpl dio;
  AddTaskRepo({required this.dio});
  Future<Either<String, String>> addTask({
    required String image,
    required String title,
    required String desc,
    required String priority,
    required String dueDate,
  }) async {
    try {
      var response = await dio.post(
        endPoint: EndPoints.createTask,
        data: {
          "image": image,
          "title": title,
          "desc": desc,
          "priority": priority,
          "dueDate": dueDate,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return right('Success');
      } else {
        return left(response.data['message']);
      }
    } on PrimaryServerException catch (e) {
      return left(e.message);
    } catch (e) {
      return left(AppStrings.processFailed);
    }
  }

  Future<Either<String, String>> uploadImage({required File image}) async {
    try {
      d.FormData formData = d.FormData.fromMap({
        "image": await multipart_file.MultipartFile.fromFile(image.path,
            filename: image.path.split('/').last),
      });
      var response = await dio.post(
        data: formData,
        endPoint: EndPoints.uploadImage,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return right(response.data['image']);
      } else {
        return left(response.data['message']);
      }
    } on PrimaryServerException catch (e) {
      return left(e.message);
    } catch (e) {
      return left(AppStrings.processFailed);
    }
  }

  Future<Either<String, Unit>> deleteTask({required int taskId}) async {
    try {
      var response = await dio.put(endPoint: EndPoints.updateTask(taskId));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return right(unit);
      } else {
        return left(response.data['message']);
      }
    } on PrimaryServerException catch (e) {
      return left(e.message);
    } catch (e) {
      return left(AppStrings.processFailed);
    }
  }

  Future<Either<String, String>> editTask({
    required String image,
    required String title,
    required String desc,
    required String priority,
    required String dueDate,
    required String status,
    required String taskId,
  }) async {
    try {
      var response = await dio.post(
        endPoint: EndPoints.createTask,
        data: {
          "image": image,
          "title": title,
          "desc": desc,
          "priority": priority,
          "dueDate": dueDate,
          "status": status,
          "user": taskId,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return right('Success');
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
