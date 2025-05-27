import 'package:flutter_clean_architecture/config/theme/theme_type.dart';

abstract class ThemeEvent {}

class SetTheme extends ThemeEvent {
  final ThemeType themeType;

  SetTheme(this.themeType);
}
