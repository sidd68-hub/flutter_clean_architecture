import 'package:flutter_clean_architecture/core/network/api_result.dart';
import 'package:flutter_clean_architecture/feature/screen/home_view/domain/entities/home_user_entities.dart';

abstract class HomeRepository {
  Future<List<User>> fetchUser({int page});
}