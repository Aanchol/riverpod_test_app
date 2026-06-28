import 'package:flutter/material.dart';

import '../../../../core/responsive/app_layout.dart';
import 'dashboard_desktop.dart';
import 'dashboard_mobile.dart';
import 'dashboard_tablet.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppLayout(
      mobile: DashboardMobile(),
      tablet: DashboardTablet(),
      desktop: DashboardDesktop(),
    );
  }
}
