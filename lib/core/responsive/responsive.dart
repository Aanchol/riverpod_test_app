import 'package:flutter/material.dart';

import '../enums/screen_type.dart';
import 'breakpoints.dart';

class Responsive {
  static ScreenType screenType(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width >= Breakpoints.tablet) {
      return ScreenType.desktop;
    }

    if (width >= Breakpoints.mobile) {
      return ScreenType.tablet;
    }

    return ScreenType.mobile;
  }
}
