import 'package:dartz/dartz.dart';
import 'package:tt/core/localization/app_strings.dart';
import 'package:tt/core/models/errors/exceptions.dart';
import 'package:tt/core/services/network_service/api_service.dart';

import '../../../../core/services/cache/cash_helper.dart';
import '../../../../core/services/cache/cash_keys.dart';
import '../../../../core/services/network_service/endpoints.dart';

class RegisterRepo {
  DioImpl dio;
  RegisterRepo({required this.dio});
  Future<Either<String, Unit>> register({
    required String phone,
    required String password,
    required String displayName,
    required String experienceYears,
    required String address,
    required String level,
  }) async {
    try {
      var response = await dio.post(
        endPoint: EndPoints.register,
        data: {
          "phone": phone,
          "password": password,
          "displayName": displayName,
          "experienceYears": experienceYears,
          "address": address,
          "level": level,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        CashHelper.setData(CacheKeys.token, response.data['access_token']);
        return right(unit);
      } else {
        return left(AppStrings.processFailed);
      }
    } on PrimaryServerException catch (e) {
      return left(e.message);
    } catch (e) {
      return left(AppStrings.processFailed);
    }
  }
}
