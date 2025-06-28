import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transparentColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.transparentColor,
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.blackColorBg,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.primaryColor),
    ),
  );
}
