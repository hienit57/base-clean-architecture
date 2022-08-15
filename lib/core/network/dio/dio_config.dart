import 'package:dio/dio.dart';
import 'package:metaway_holdings/core/environment/environment.dart';
import 'package:metaway_holdings/core/local/prefs_service.dart';
import 'flutter_transformer.dart';
import 'package:flutter/foundation.dart' as Foundation;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

int _connectTimeOut = 60000;
Dio apiprovider() {
  final appEnv = Environment().env();
  final options = BaseOptions(
    baseUrl: appEnv.baseUrl,
    receiveTimeout: _connectTimeOut,
    connectTimeout: _connectTimeOut,
    followRedirects: false,
  );
  final dio = Dio(options);
  dio.transformer = FlutterTransformer();
  dio.interceptors.add(
    InterceptorsWrapper(onRequest:
        (RequestOptions options, RequestInterceptorHandler handler) async {
      String accessToken = await PrefsService.getToken();
      options.baseUrl = appEnv.baseUrl;

      options.headers["channel-id"] = "604";
      options.headers['client-type'] = "2";
      options.headers['content-type'] = "application/json";

      //TODO: Add language
      // Default: vi_VN
      // var language = StoreManager.getLanguage();
      // options.headers['X-Accept-Language'] = language;

      if (accessToken.isNotEmpty) {
        options.headers.remove('X-OAuth-Token');
        options.headers['X-OAuth-Token'] = accessToken;
      }
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response); // continue
    }, onError: (DioError e, handler) {
      return handler.next(e); //continue
    }),
  );
  if (Foundation.kDebugMode) {
    dio.interceptors.add(dioLogger());
  }
  return dio;
}

PrettyDioLogger dioLogger() {
  return PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    request: true,
    maxWidth: 100,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
  );
}
