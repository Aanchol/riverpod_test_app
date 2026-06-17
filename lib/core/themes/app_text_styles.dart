import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const titleXBoldTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static const greenBoldTextStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.green,
  );
  static const largeBoldTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static const mediumTextStyle = TextStyle(fontSize: 16, height: 1.5);
  static const largeBlackTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontSize: 12,
  );

  static const labelTextStyle = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );
}
