import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/di/injector.dart';
import 'package:flutter_clean_architecture/feature/screen/home_view/presentation/bloc/home_bloc.dart';
import 'package:flutter_clean_architecture/feature/screen/home_view/presentation/view/home_screen.dart';
import 'package:flutter_clean_architecture/feature/screen/login/bloc/login_bloc.dart';
import 'package:flutter_clean_architecture/feature/screen/login/login_di/login_di.dart';
import 'package:flutter_clean_architecture/feature/screen/login/login_screen.dart';
import 'package:flutter_clean_architecture/main.dart';
import 'package:go_router/go_router.dart';


class AppRouter{
  static final GoRouter router = GoRouter(
    navigatorKey:  navigatorKey,
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) {
          initLoginModule();
          return BlocProvider(create: (_) => sl<LoginBloc>(),
            child: LoginScreen(),);
        },
      ),
      GoRoute(
        path: '/',
        builder: (context, state) {
          return BlocProvider(
            create: (_) => sl<HomeBloc>(),
            child: const HomeScreen(),
          );
        },
      ),
    ],
  );
}


