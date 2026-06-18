import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppFontSize {
  static double get tooSmallTextSize => 10;

  static double get smallTextSize => 12;

  static double get mediumTextSize => 14;

  static double get largeTextSize => 16;

  static double get semiLargeTextSize => 18;

  static double get extraLargeTextSize => 20;

  static double get xxLargeTextSize => 24;

  static double get xxxLargeTextSize => 28;
}

class AppTextStyles {
  AppTextStyles._();

  static TextStyle titleXLBoldTextStyle = TextStyle(
    fontSize: AppFontSize.extraLargeTextSize,
    fontWeight: FontWeight.w600,
  );

  static TextStyle greenBoldTextStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.green,
  );
  static TextStyle largeBoldTextStyle = TextStyle(
    fontSize: AppFontSize.semiLargeTextSize,
    fontWeight: FontWeight.bold,
  );
  static TextStyle mediumTextStyle = TextStyle(
    fontSize: AppFontSize.largeTextSize,
    height: 1.5,
  );

  static TextStyle largeBlackTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontSize: AppFontSize.smallTextSize,
  );

  static TextStyle labelTextStyle = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w400,
    fontSize: AppFontSize.smallTextSize,
  );
}
