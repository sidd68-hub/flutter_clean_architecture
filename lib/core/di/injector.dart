import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/core/network/network_info.dart';
import 'package:flutter_clean_architecture/data/repositories/auth_repository_impl.dart';
import 'package:flutter_clean_architecture/domain/repositories/auth_repository.dart';
import 'package:flutter_clean_architecture/domain/usecase/login_user.dart';
import 'package:flutter_clean_architecture/presentation/bloc/connectivity/connectivity_bloc.dart';
import 'package:flutter_clean_architecture/presentation/bloc/locale/language_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Network
  sl.registerLazySingleton<Connectivity>(() => Connectivity());

  sl.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true));
    return dio;
  });

  // Secure Storage
  sl.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());

  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // Use Cases
  sl.registerLazySingleton(() => LoginUser(sl()));

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => ConnectivityBloc(sl<Connectivity>()));
  sl.registerLazySingleton<LocaleBloc>(() => LocaleBloc());

}
