import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const titleXXBoldTextStyle = TextStyle(
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
}
