// core/network/safe_api_call.dart

import 'package:dio/dio.dart';
import 'api_result.dart';

Future<ApiResult<T>> safeApiCall<T>(Future<T> Function() apiCall) async {
  try {
    final result = await apiCall();
    return ApiSuccess(result);
  } on DioException catch (dioError) {
    final statusCode = dioError.response?.statusCode;
    final message = dioError.response?.data?['message']?.toString() ??
        dioError.message ??
        'Unknown error';
    return ApiFailure(message, statusCode);
  } catch (e) {
    return ApiFailure(e.toString());
  }
}
