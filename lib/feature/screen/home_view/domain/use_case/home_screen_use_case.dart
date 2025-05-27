import 'package:flutter_clean_architecture/core/network/api_result.dart';
import 'package:flutter_clean_architecture/feature/screen/home_view/domain/entities/home_user_entities.dart';
import 'package:flutter_clean_architecture/feature/screen/home_view/domain/repositories/home_repositories.dart';

class HomeScreenUseCase{
  final HomeRepository repository;

  HomeScreenUseCase(this.repository);


  Future<ApiResult<List<User>>> call({int page = 1}) {
    return repository.fetchUser(page: page);
  }
}