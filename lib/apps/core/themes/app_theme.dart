import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  const AppTheme._();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: AppColors.black),
      titleTextStyle: TextStyle(color: AppColors.black, fontSize: 18),
      centerTitle: false,
    ),
    canvasColor: AppColors.white,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.secondary,
      primary: AppColors.primary,
    ),
  );
}
