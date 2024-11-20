// ignore_for_file: implementation_imports

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:dio/src/multipart_file.dart' as multipart_file;
import 'package:tt/core/extension/navigation_extension.dart';


import 'package:tt/core/models/errors/exceptions.dart';
import 'package:tt/core/routes/app_pages.dart';
import 'package:tt/core/services/cache/cash_helper.dart';
import 'package:tt/core/services/network_service/endpoints.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../cache/cash_keys.dart';
import '../setup/getIt.dart';

abstract class DioHelper {
  Future<dynamic> post({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });
  Future<dynamic> put({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });
  Future<dynamic> delete({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });

  Future<dynamic> get({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });

  Future<dynamic> download({required String url});
}

class DioImpl extends DioHelper {
  DioImpl();

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: EndPoints.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 8),
    ),
  )..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 100));

  @override
  Future<dynamic> get({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    if (timeOut != null) {
      dio.options.connectTimeout = Duration(seconds: timeOut);
    }

    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      "x-version": '1.0',
      'Authorization': 'Bearer ${await CashHelper.getData(CacheKeys.token)}',
    };
//just for test
    dio.options.baseUrl = base ?? dio.options.baseUrl;
    debugPrint('URL => ${dio.options.baseUrl + endPoint}');
    debugPrint('Header => ${dio.options.headers.toString()}');
    debugPrint('Body => $data');
    debugPrint('Query => $query');

    dio.options.baseUrl = base ?? dio.options.baseUrl;
    return await request(
      call: () async => await dio.get(
        endPoint,
        queryParameters: query,
        data: data,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  Future<dynamic> post({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    if (timeOut != null) {
      dio.options.connectTimeout = Duration(seconds: timeOut);
    }

    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (isMultipart) 'Accept': '*/*',
      "x-version": '1.0',
      // if (await CashHelper.checkToken())
      'Authorization': 'Bearer ${await CashHelper.getData(CacheKeys.token)}',
    };

    return await request(
      call: () async => await dio.post(
        endPoint,
        data: data,
        queryParameters: query,
        onSendProgress: progressCallback,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  Future<dynamic> put({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    if (timeOut != null) {
      dio.options.connectTimeout = Duration(seconds: timeOut);
    }

    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (isMultipart) 'Accept': '*/*',
      "x-version": '1.0',
      // if (await CashHelper.checkToken())
      'Authorization': 'Bearer ${await CashHelper.getData(CacheKeys.token)}',
    };

    return await request(
      call: () async => await dio.post(
        endPoint,
        data: data,
        queryParameters: query,
        onSendProgress: progressCallback,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  Future<dynamic> delete({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    if (timeOut != null) {
      dio.options.connectTimeout = Duration(seconds: timeOut);
    }

    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (isMultipart) 'Accept': '*/*',
      "x-version": '1.0',
      // if (await CashHelper.checkToken())
      'Authorization': 'Bearer ${await CashHelper.getData(CacheKeys.token)}',
    };

    return await request(
      call: () async => await dio.delete(
        endPoint,
        data: data,
        queryParameters: query,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  Future download({required String url}) async {
    return await Dio().get(url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ));
  }

  Future uploadFormData(FormData formData, String url) async {
    Dio newDioOpj = Dio()
      ..interceptors.add(PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 100));
    return await newDioOpj.post(url,
        options: Options(headers: {
          'Content-Type': 'multipart/form-data',
          'Accept': 'application/json',
          'Authorization': await CashHelper.getData("token"),
          "x-version": '1.0',
        }),
        data: formData);
  }

  multiPartTheFile(File? file) async {
    if (file != null) {
      multipart_file.MultipartFile fileChunks =
          await multipart_file.MultipartFile.fromFile(file.path,
              filename: file.path.split('/').last);
      return fileChunks;
    } else {
      return null;
    }
  }
}

extension on DioHelper {
  Future request({
    required Future<Response> Function() call,
  }) async {
    try {
      final r = await call.call();
      debugPrint("Response_Data => ${r.data}");
      debugPrint("Response_Code => ${r.statusCode}");

      return r;
    } on DioException catch (e) {
      debugPrint("Error_Message => ${e.message}");
      debugPrint("Error_Error => ${e.error.toString()}");
      debugPrint("Error_Type => ${e.type.toString()}");

      switch (e.type) {
        case DioExceptionType.cancel:
          throw PrimaryServerException(
            code: 100,
            error: e.toString(),
            message: "request has been canceled",
          );

        case DioExceptionType.connectionTimeout:
          throw PrimaryServerException(
            code: 100,
            error: e.toString(),
            message: "sorry! your connection has timed out!",
          );
        case DioExceptionType.sendTimeout:
          throw PrimaryServerException(
              code: 100,
              error: e.toString(),
              message: "sorry! your send request has timed out!");
        case DioExceptionType.receiveTimeout:
          throw PrimaryServerException(
              code: 100,
              error: e.toString(),
              message: "sorry! your recieve request has timed out!");
        case DioExceptionType.badResponse:
          if (e.response!.data['statusCode'] == 401) {
            CashHelper.sharedPreferences?.clear();
            getIt<NavigationService>()
                .navigatorKey
                .currentContext!
                .navigateToAndReplacement(AppPages.login);

            throw PrimaryServerException(
                code: 401,
                error: e.toString(),
                message: e.response!.data['message'].toString());
          }
          throw PrimaryServerException(
              code: 405,
              error: e.toString(),
              message: e.response!.data['message'].toString());

        default:
          throw PrimaryServerException(
              code: 100,
              error: e.toString(),
              message: 'Connection Error');
      }
    } catch (e) {
      PrimaryServerException exception = e as PrimaryServerException;

      throw PrimaryServerException(
        code: exception.code,
        error: exception.error,
        message: exception.message,
      );
    }
  }
}
