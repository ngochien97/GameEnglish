import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:turtle_game/database/local_storage.dart';

import '../../app_config/environment.dart';
import 'meey_intercepter.dart';

class ApiClient {
  static const String SUMMARY = '/summary';
  final LocalStorageImpl localStorage;
  final Dio dio;

  ApiClient(this.dio, this.localStorage) {
    dio.options.baseUrl = Environment.value!.baseUrl;
    dio.options.connectTimeout = const Duration(minutes: 3).inMilliseconds;
    dio.options.receiveTimeout = const Duration(minutes: 3).inMilliseconds;

    if (Environment.value!.environmentType != EnvType.PRODUCTION) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: false,
          error: true,
          compact: true,
        ),
      );
    }
    dio.interceptors.add(MeyInterceptors(localStorage));
  }

  Future<Response> post(String path, {dynamic data}) async {
    return await dio.post(path, data: data);
  }

  Future<Response> put(String path, {dynamic data}) async {
    return await dio.put(path, data: data);
  }

  Future<Response> delete(String path, {Map<String, dynamic>? param}) async {
    return await dio.delete(path, queryParameters: param);
  }

  Future<Response> get(String path, {Map<String, dynamic>? param}) async {
    return await dio.get(path, queryParameters: param);
  }
}
