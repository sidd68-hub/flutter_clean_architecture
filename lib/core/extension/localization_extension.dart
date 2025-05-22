import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/l10/app_localizations.dart';

extension AppLocal on BuildContext{
  AppLocalizations get loc => AppLocalizations.of(this);
}