import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/di/injector.dart';
import 'package:flutter_clean_architecture/main.dart';
import 'package:flutter_clean_architecture/presentation/screen/login/bloc/login_bloc.dart';
import 'package:flutter_clean_architecture/presentation/screen/home_view/bloc/home_bloc.dart';
import 'package:flutter_clean_architecture/presentation/screen/home_view/view/home_screen.dart';
import 'package:flutter_clean_architecture/presentation/screen/login/login_di/login_di.dart';
import 'package:flutter_clean_architecture/presentation/screen/login/login_screen.dart';
import 'package:go_router/go_router.dart';


class AppRouter{
  static final GoRouter router = GoRouter(
    navigatorKey:  navigatorKey,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          initLoginModule();
          return BlocProvider(create: (_) => sl<LoginBloc>(),
            child: LoginScreen(),);
        },
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) {
          return BlocProvider(
            create: (_) => HomeBloc(),
            child: const HomeScreen(),
          );
        },
      ),
    ],
  );
}


