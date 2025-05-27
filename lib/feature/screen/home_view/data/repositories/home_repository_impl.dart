import 'package:flutter_clean_architecture/core/network/api_result.dart';
import 'package:flutter_clean_architecture/feature/screen/home_view/data/datasources/home_remote_datasource.dart';
import 'package:flutter_clean_architecture/feature/screen/home_view/domain/entities/home_user_entities.dart';
import 'package:flutter_clean_architecture/feature/screen/home_view/domain/repositories/home_repositories.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<ApiResult<List<User>>> fetchUser({int page = 1}) async {
    final result = await remoteDataSource.fetchUser(page: page);

    return result.when(
      success: (models) {
        // Map NewUserModel to User
        final users = models
            .map((e) => User(
          id: e.id,
          email: e.email,
          firstName: e.firstName,
          lastName: e.lastName,
          avatar: e.avatar,
        ))
            .toList();
        return ApiSuccess(users);
      },
      failure: (message, code) {
        return ApiFailure(message, code);
      },
    );
  }
}
