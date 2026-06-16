import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'NunitoSans',
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
    ),
    splashFactory: InkSplash.splashFactory,
    dividerTheme: const DividerThemeData(color: AppColors.dividerColor),
    cardTheme: const CardThemeData(
      color: AppColors.cardColor,
      surfaceTintColor: AppColors.cardColor,
    ),
    dialogTheme: const DialogThemeData(
      backgroundColor: AppColors.cardColor,
      surfaceTintColor: AppColors.cardColor,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.cardColor,
      surfaceTintColor: AppColors.cardColor,
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.cardColor,
      surfaceTintColor: AppColors.cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: AppColors.cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    appBarTheme: const AppBarTheme(
      // titleSpacing: 0,
      backgroundColor: AppColors.background,
      surfaceTintColor: AppColors.background,
    ),
    tabBarTheme: const TabBarThemeData(labelColor: AppColors.primary),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.primary,
        iconColor: AppColors.white,
        fixedSize: const Size.fromHeight(kMinInteractiveDimension),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.textPrimary,
        backgroundColor: AppColors.white,
        iconColor: AppColors.iconColor,
        fixedSize: const Size.fromHeight(kMinInteractiveDimension),
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.iconColor),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      hintStyle: const TextStyle(color: AppColors.textSecondary),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(20),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(20),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primary),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.red),
        borderRadius: BorderRadius.circular(20),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.red),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: SegmentedButton.styleFrom(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.textPrimary,
        selectedBackgroundColor: AppColors.primary,
        selectedForegroundColor: AppColors.white,
        side: const BorderSide(color: AppColors.primary),
      ),
    ),
    popupMenuTheme: PopupMenuThemeData(
      elevation: 1,
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      textStyle: const TextStyle(fontSize: 14),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primary,
    ),
  );
}
