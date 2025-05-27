import 'package:flutter_clean_architecture/domain/repositories/auth_repository.dart';

class SignupUser {
  final AuthRepository repository;

  SignupUser(this.repository);

  Future<void> call(String email, String password) {
    return repository.signup(email, password);
  }
}