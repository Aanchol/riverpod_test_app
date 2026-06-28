import 'package:flutter/material.dart';

import 'breakpoints.dart';

class ResponsiveValue {
  const ResponsiveValue._();

  static T value<T>({
    required BuildContext context,
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    final width = MediaQuery.sizeOf(context).width;

    if (width >= Breakpoints.tablet) {
      return desktop ?? tablet ?? mobile;
    }

    if (width >= Breakpoints.mobile) {
      return tablet ?? mobile;
    }

    return mobile;
  }
}
