import 'package:flutter_clean_architecture/core/network/api_result.dart';
import 'package:flutter_clean_architecture/feature/screen/home_view/data/model/user_new_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<NewUserModel>> fetchUser({int page});
}