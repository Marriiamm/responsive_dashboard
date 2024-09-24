import 'package:flutter/material.dart';

import 'dashboard_mobile_layout.dart';
import 'widgets/drawer_widget.dart';

class DashboardTabletLayout extends StatelessWidget {
  const DashboardTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(flex: 1, child: CustomDrawer()),
        SizedBox(
          width: 16,
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: DashboardMobileLayout(),
          ),
        ),
        SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
