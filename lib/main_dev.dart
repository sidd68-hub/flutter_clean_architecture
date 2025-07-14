import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app.dart';
import 'package:flutter_clean_architecture/core/di/injector.dart';
import 'package:flutter_clean_architecture/flavour/environment.dart';

import 'core/utils/app_enum.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  Environment.flavor = Flavor.dev;
  WidgetsFlutterBinding.ensureInitialized();
  await init(); // Initialize DI
  runApp(const AppView());
}