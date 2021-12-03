import 'package:dio/dio.dart';
import 'package:turtle_game/constants/constants.dart';
import 'package:turtle_game/database/local_storage.dart';

import 'exceptions/server_exception.dart';

class MeyInterceptors extends InterceptorsWrapper {
  final LocalStorageImpl _localStorage;
  MeyInterceptors(this._localStorage);

  @override
  Future<RequestOptions> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);
    // ignore: omit_local_variable_types
    String token = await _localStorage.get(PrefKeys.TOKEN) ?? '';
    final headers = <String, dynamic>{};

    if (token.isNotEmpty) {
      headers["token"] = token;
    }
    // headers["platform"] = ApiConfig.platform;
    // headers["appVersion"] = ApiConfig.appVersion;
    options.headers.addAll(headers);
    return options;
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    ServerExceptionError.withError(error: (err));
    super.onError(err, handler);
  }

  Future<Response> retryToken(Response response) async {
    return response;
  }
}
