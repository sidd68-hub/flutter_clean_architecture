import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/core/network/api_result.dart';
import 'package:flutter_clean_architecture/core/network/safe_api_call.dart';
import 'package:flutter_clean_architecture/feature/screen/home_view/data/model/user_new_model.dart';

import 'home_remote_datasource.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource{
  final Dio dio;
  HomeRemoteDataSourceImpl(this.dio);

  @override
  Future<ApiResult<List<NewUserModel>>> fetchUser({int page = 1}) async{
    try {
      final response = await dio.get('api/users', queryParameters: {'page': page});
      final List<dynamic> userJson = response.data['data'];
      final users = userJson.map((e) => NewUserModel.fromJson(e)).toList();
      return ApiSuccess(users);
    } on DioException catch (dioError) {
      final message = dioError.response?.data['message']?.toString() ?? dioError.message ?? 'Unknown error';
      final statusCode = dioError.response?.statusCode;
      return ApiFailure(message, statusCode);
    } catch (e) {
      return ApiFailure(e.toString());
    }
  }
}