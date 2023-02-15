import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as storage;

import '../../models/login_tokens.dart';

class SpringApiInterceptor extends Interceptor {
  Dio dio = Dio();

  final _storage = const storage.FlutterSecureStorage();
  static const ACCESS_TOKEN = "ACCESS_TOKEN";
  static const REFRESH_TOKEN = "REFRESH_TOKEN";
  static const FORM_URL_ENCODED_CONTENT_TYPE =
      "application/x-www-form-urlencoded;charset=utf-8";
  static const JSON_CONTENT_TYPE = "application/json; charset=utf-8";
  void saveTokens(String accessToken, String refreshToken) {
    _storage.write(key: ACCESS_TOKEN, value: accessToken);
    _storage.write(key: REFRESH_TOKEN, value: refreshToken);
  }

  SpringApiInterceptor() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          //TODO: if login or register then skip adding token body
          if (options.path.contains("api/login") || options.path.contains("api/users/save")) {
            return handler.next(options); //continue
          }
          var accessToken = await _storage.read(key: ACCESS_TOKEN);
          options.headers['Authorization'] = 'Bearer $accessToken';
          if (options.method.contains("PATCH")) {
            options.headers['Content-Type'] = JSON_CONTENT_TYPE;
          } else {
          options.headers['Content-Type'] = FORM_URL_ENCODED_CONTENT_TYPE;
          }
          return handler.next(options); //continue
        },
        onResponse: (response, handler) async {
          //TODO: if login or register, then save access and refresh token
          if (response.data.toString().contains("access_token")) {
            var tokens = LoginTokens.fromJson(response.data);
            _storage.deleteAll();
            saveTokens(tokens.accessToken, tokens.refreshToken);
            return handler.next(response);
          }
          return handler.next(response);
        },
        onError: (DioError e, handler) async {
          if (e.response?.statusCode == 403 || e.response?.statusCode == 401) {
            await refreshToken();
            return handler.resolve(await _retry(e.requestOptions));
          }
          return handler.next(e);
        },
      ),
    );
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = new Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  Future<void> refreshToken() async {
    final refreshToken = await this._storage.read(key: REFRESH_TOKEN);
    //TODO: What is the refresh token endpoing? Check Spring!
    final response = await dio.post(
      '/users/refresh',
      data: {'token': refreshToken},
    );

    if (response.statusCode == 200) {
      var tokens = LoginTokens.fromJson(response.data);
      _storage.deleteAll();
      saveTokens(tokens.accessToken, tokens.refreshToken);
    }
  }
}
