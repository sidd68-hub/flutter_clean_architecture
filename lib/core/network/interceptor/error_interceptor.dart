import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      //TODO Handle Navigation
    }
    // You can parse and wrap the error nicely here
    return handler.next(err);
  }
}
