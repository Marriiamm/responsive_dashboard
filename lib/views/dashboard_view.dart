import 'package:flutter/material.dart';
import 'package:responsive_dash_board/views/widgets/adaptive_layout_widget.dart';

import 'widgets/dash_board_desktop_layout.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF7F9FA),
      body: AdaptiveLayoutWidget(
        mobileLayout: (BuildContext context)=>const SizedBox(),
        tabletLayout: (BuildContext context)=>const SizedBox(),
        desktopLayout: (BuildContext context)=>const DashboardDesktop(),
      ),
    );
  }
}
