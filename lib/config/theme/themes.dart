import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/config/theme/app_schema.dart';

final ThemeData firstTheme = ThemeData(
  brightness: Brightness.light,
  extensions: <ThemeExtension<dynamic>>[
    AppColorScheme(
      p0: Color(0xFFFFE7FF),
      p1: Color(0xFFC89EE0),
      p2: Color(0xFF9867C5),
    ),
  ],
);

final ThemeData darkTealTheme = ThemeData(
  brightness: Brightness.dark,
  extensions: const <ThemeExtension<dynamic>>[
    AppColorScheme(
      p0: Color(0xFFFDC3FE),
      p1: Color(0xFF9FE8DF),
      p2: Color(0xFF4DCBB1),
    ),
  ],
);
