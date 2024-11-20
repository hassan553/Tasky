import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:tt/core/localization/app_strings.dart';
import 'package:tt/core/models/errors/exceptions.dart';
import 'package:tt/core/services/network_service/api_service.dart';
import 'package:tt/features/auth/data/model/user_model.dart';

import '../../../../core/services/cache/cash_helper.dart';
import '../../../../core/services/cache/cash_keys.dart';
import '../../../../core/services/network_service/endpoints.dart';

class ProfileRepo {
  DioImpl dio;
  ProfileRepo({required this.dio});
  Future<Either<String, UserModel>> getUserProfile() async {
    try {
      var response = await dio.get(endPoint: EndPoints.profile);
      if (response.statusCode == 200 || response.statusCode == 201) {
        UserModel user = UserModel.fromJson(response.data);
        CashHelper.setData(CacheKeys.userModel, json.encode(user));
        return right(user);
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
