import 'package:flutter/material.dart';

import '../enums/screen_type.dart';
import 'responsive.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key, required this.mobile, this.tablet, this.desktop});

  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    final deviceType = Responsive.screenType(context);

    switch (deviceType) {
      case ScreenType.desktop:
        return desktop ?? tablet ?? mobile;

      case ScreenType.tablet:
        return tablet ?? mobile;

      case ScreenType.mobile:
        return mobile;
    }
  }
}
