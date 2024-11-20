import 'package:dartz/dartz.dart';
import 'package:tt/core/models/errors/exceptions.dart';
import 'package:tt/core/services/network_service/api_service.dart';

import '../../../../core/services/cache/cash_helper.dart';
import '../../../../core/services/cache/cash_keys.dart';
import '../../../../core/services/network_service/endpoints.dart';

class LoginRepo {
  DioImpl dio;
  LoginRepo({required this.dio});
  Future<Either<String, Unit>> login({
    required String phone,
    required String password,
  }) async {
    try {
      var response = await dio.post(
        endPoint: EndPoints.login,
        data: {
          "phone": phone,
          "password": password,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        CashHelper.setData(CacheKeys.token, response.data['access_token']);
        return right(unit);
      } else {
        return left(response.data['message']);
      }
    } on PrimaryServerException catch (e) {
      return left(e.message);
    } catch (e) {
      return left('Process Failed');
    }
  }
}
