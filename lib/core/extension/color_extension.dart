import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/config/theme/app_schema.dart';

extension AppColorExtension on BuildContext{
  AppColorScheme get appColors {
    final colorScheme = Theme.of(this).extension<AppColorScheme>();
    assert(colorScheme != null, 'AppColorScheme is not found in ThemeData.extension');
    return colorScheme!;
  }
}