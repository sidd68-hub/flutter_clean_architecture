import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app.dart';
import 'package:flutter_clean_architecture/core/di/injector.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init(); // Initialize DI
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return AppView();
  }
}


// Theme Bloc
/*
BlocProvider<ThemeBloc>(
create: (_) => sl<ThemeBloc>(),
child: MaterialApp.router(...),
)*/
