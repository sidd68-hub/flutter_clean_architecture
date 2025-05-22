import 'package:flutter_clean_architecture/core/di/injector.dart';
import 'package:flutter_clean_architecture/domain/usecase/login_user.dart';
import 'package:flutter_clean_architecture/presentation/screen/login/bloc/login_bloc.dart';


void initLoginModule() {
  if (!sl.isRegistered<LoginUser>()) {
    sl.registerLazySingleton(() => LoginUser(sl()));
  }

  if (!sl.isRegistered<LoginBloc>()) {
    sl.registerFactory(() => LoginBloc(sl()));
  }
}
