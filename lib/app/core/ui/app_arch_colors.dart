import 'package:flutter/material.dart';

class AppArchColors {
  static AppArchColors? _instance;

  AppArchColors._();

  static AppArchColors get instance {
    _instance ??= AppArchColors._();

    return _instance!;
  }

  Color get primary => const Color(0XFF007D21);
  Color get secondary => const Color(0XFFF88B0C);
}

extension AppArchColorsExtensions on BuildContext {
  AppArchColors get colors => AppArchColors.instance;
}
