import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

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
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.textPrimary,
      selectionColor: AppColors.textPrimary,
      selectionHandleColor: AppColors.textPrimary,
    ),
    dropdownMenuTheme: const DropdownMenuThemeData(
      textStyle: TextStyle(color: AppColors.textPrimary),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: AppTextStyles.labelTextStyle,
      filled: true,
      fillColor: AppColors.white,
      hintStyle: AppTextStyles.labelTextStyle,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.black),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.black),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.black),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.red),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.red),
        borderRadius: BorderRadius.all(Radius.circular(8)),
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

    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }
        return null;
      }),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }
        return null;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }
        return null;
      }),
    ),
  );
}
