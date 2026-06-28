import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_side_navbar.dart';

class DashboardTablet extends StatefulWidget {
  const DashboardTablet({super.key});

  @override
  State<DashboardTablet> createState() => _DashboardTabletState();
}

class _DashboardTabletState extends State<DashboardTablet> {
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
            extended: false,
            onDestinationSelected: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          //Expanded(child: Container(color: AppColors.green)),
          Expanded(child: pages[currentIndex]),
        ],
      ),
    );
  }
}
