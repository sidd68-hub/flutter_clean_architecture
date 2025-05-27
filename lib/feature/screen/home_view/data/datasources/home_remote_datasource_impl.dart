import 'package:flutter_clean_architecture/core/network/api_result.dart';
import 'package:flutter_clean_architecture/core/network/api_client.dart';
import 'package:flutter_clean_architecture/feature/screen/home_view/data/model/user_new_model.dart';

import 'home_remote_datasource.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiClient apiClient;

  HomeRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<ApiResult<List<NewUserModel>>> fetchUser({int page = 1}) async {
    final result = await apiClient.safeApiCall(
          () => apiClient.dio.get('/api/users', queryParameters: {'page': page}),
    );
    return result.when(
      success: (response) {
        final Map<String, dynamic> data = response.data as Map<String, dynamic>;
        final List<dynamic> userJson = data['data'];
        final users = userJson.map((e) => NewUserModel.fromJson(e)).toList();
        return ApiSuccess(users);
      },
      failure: (message, statusCode) {
        return ApiFailure(message, statusCode);
      },
    );
  }
}
