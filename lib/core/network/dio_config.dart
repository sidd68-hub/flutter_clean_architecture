import 'package:dio/dio.dart';

class DioConfig {
  static BaseOptions get baseOptions => BaseOptions(
    baseUrl: 'https://reqres.in/',
    headers: {
      'x-api-key': 'reqres-free-v1',
    },
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    responseType: ResponseType.json
  );
}


