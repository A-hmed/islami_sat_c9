import 'package:flutter/material.dart';
import 'package:islami_sat_c9/ui/utils/app_colors.dart';

abstract class AppTheme{
  static const TextStyle appBarTitleTextStyle =
  TextStyle(fontWeight: FontWeight.bold, color: AppColors.accent, fontSize: 30);

  static const TextStyle quranTabTitleTextStyle = TextStyle(fontWeight: FontWeight.w600,
   color: AppColors.accent, fontSize: 25);

  static const TextStyle settingsTabTitleTextStyle = TextStyle(fontWeight: FontWeight.w600,
      color: AppColors.accent, fontSize: 25);

  static const TextStyle settingsTabOptionTextStyle = TextStyle(fontWeight: FontWeight.normal,
      color: AppColors.accent, fontSize: 20);

  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primiary,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.transparent,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: appBarTitleTextStyle
    ),
    scaffoldBackgroundColor: AppColors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.accent,
      unselectedIconTheme: IconThemeData(size: 28),
      selectedIconTheme: IconThemeData(size: 32),
    ),
    dividerTheme: DividerThemeData(color: AppColors.primiary, thickness: 3),
    textTheme: const TextTheme(
      bodyMedium: quranTabTitleTextStyle,
      bodyLarge: settingsTabTitleTextStyle,
      bodySmall: settingsTabOptionTextStyle
    )
  );
  static ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.primiaryDark,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.transparent,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: appBarTitleTextStyle.copyWith(color: AppColors.white)
      ),
      scaffoldBackgroundColor: AppColors.transparent,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.accentDark,
        unselectedIconTheme: IconThemeData(size: 28),
        selectedIconTheme: IconThemeData(size: 32),
      ),
      dividerTheme: DividerThemeData(color: AppColors.accentDark, thickness: 3),
      textTheme: TextTheme(
          bodyMedium: quranTabTitleTextStyle.copyWith(color: AppColors.white),
          bodyLarge: settingsTabTitleTextStyle.copyWith(color: AppColors.white),
          bodySmall: settingsTabOptionTextStyle.copyWith(color: AppColors.white)
      )
  );
}