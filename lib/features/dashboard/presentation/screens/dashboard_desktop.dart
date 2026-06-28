import 'package:flutter/material.dart';

import '../../../../core/enums/settings_type.dart';
import '../../../../core/widgets/custom_segmented_button.dart';
import '../../../../core/widgets/custom_side_navbar.dart';

class DashboardDesktop extends StatefulWidget {
  const DashboardDesktop({super.key});

  @override
  State<DashboardDesktop> createState() => _DashboardDesktopState();
}

class _DashboardDesktopState extends State<DashboardDesktop> {
  Set<Settings> selected = {Settings.home};
  int currentIndex = 0;
  final pages = const [
    Center(child: Text('Home')),
    Center(child: Text('Profile')),
    Center(child: Text('Settings')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          CustomSideNav(
            selectedIndex: currentIndex,
            extended: true,
            onDestinationSelected: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          SizedBox(
            width: 250,
            child: CustomSegmentedButton<Settings>(
              multiSelectionEnabled: true,
              segments: [
                const ButtonSegment(
                  value: Settings.home,
                  label: Text('Home'),
                  icon: Icon(Icons.home),
                ),
                ButtonSegment(
                  value: Settings.profile,
                  label: const Text('Profile'),
                  icon: const Icon(Icons.person),
                ),
                ButtonSegment(
                  value: Settings.notification,
                  label: const Text('Alert'),
                  icon: const Icon(Icons.star),
                ),
              ],
              selectedValue: selected,
              onChanged: (value) {
                setState(() {
                  selected = value;
                });
              },
            ),
          ),

          Expanded(child: Container()),
        ],
      ),
    );
  }
}
