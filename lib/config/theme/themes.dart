import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/config/theme/app_schema.dart';
import 'package:flutter_clean_architecture/config/theme/theme_type.dart';


/*class AppTheme{
  final ThemeType themeType;
  AppTheme(this.themeType);

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
}*/

class AppTheme {
  static ThemeData getTheme(ThemeType themeType) {
    switch (themeType) {
      case ThemeType.light:
        return ThemeData(
          brightness: Brightness.light,
          extensions: const <ThemeExtension<dynamic>>[
            AppColorScheme(
              p0: Color(0x806A4CBD),
              p1: Color(0xFFC89EE0),
              p2: Color(0xFF9867C5),
            ),
          ],
        );
      case ThemeType.dark:
        return ThemeData(
          brightness: Brightness.dark,
          extensions: const <ThemeExtension<dynamic>>[
            AppColorScheme(
              p0: Color(0xFFFDC3FE),
              p1: Color(0xFF9FE8DF),
              p2: Color(0xFF4DCBB1),
            ),
          ],
        );
    // fallback
    }
  }
}







