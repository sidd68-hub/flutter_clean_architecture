import 'package:flutter_clean_architecture/core/di/injector.dart';
import 'package:flutter_clean_architecture/domain/usecase/login_use_case.dart';
import 'package:flutter_clean_architecture/feature/screen/login/bloc/login_bloc.dart';


void initLoginModule() {
  if (!sl.isRegistered<LoginUser>()) {
    sl.registerLazySingleton(() => LoginUser(sl()));
  }

  if (!sl.isRegistered<LoginBloc>()) {
    sl.registerFactory(() => LoginBloc(sl()));
  }
}
