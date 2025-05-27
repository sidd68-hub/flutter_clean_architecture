import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AppDioLogger {
  static List<Interceptor> get({bool enableLogging = true}) {
    if (!enableLogging) return []; // No-op interceptor

    return [
      // PrettyDioLogger(
      //   requestHeader: true,
      //   requestBody: true,
      //   responseBody: true,
      //   responseHeader: false,
      //   error: true,
      //   compact: true,
      // ),
      CurlLoggerDioInterceptor(printOnSuccess: true)
    ];
  }
}
