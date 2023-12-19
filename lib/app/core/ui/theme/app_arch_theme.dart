import 'package:app_arch/app/core/ui/styles/app_arch_colors.dart';
import 'package:app_arch/app/core/ui/styles/app_arch_fonts.dart';
import 'package:flutter/material.dart';

class AppArchTheme {
  AppArchTheme._();

  static final theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    primaryColor: AppArchColors.instance.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppArchColors.instance.primary,
      primary: AppArchColors.instance.primary,
      secondary: AppArchColors.instance.secondary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(13),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: BorderSide(color: Colors.grey[400]!),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: BorderSide(color: Colors.grey[400]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: BorderSide(color: Colors.grey[400]!),
      ),
      labelStyle:
          AppArchFonts.instance.textRegular.copyWith(color: Colors.black),
      errorStyle:
          AppArchFonts.instance.textRegular.copyWith(color: Colors.redAccent),
    ),
  );
}
