import 'package:flutter/material.dart';
import 'package:responsive_dash_board/utils/size_config.dart';
import 'package:responsive_dash_board/views/widgets/adaptive_layout_widget.dart';

import 'dash_board_desktop_layout.dart';
import 'dashboard_mobile_layout.dart';
import 'dashboard_tablet_layout.dart';
import 'widgets/drawer_widget.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey() ;
//if (clinic.about!.isNotEmpty) ...[
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: MediaQuery.sizeOf(context).width < SizeConfig.tablet
          ? AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                onPressed:(){
                  scaffoldKey.currentState!.openDrawer();
                } ,
                icon: const Icon(
                  Icons.menu,
                  color: Color(0xff4EB7F2),
                ),
              ),
            )
          : null,
      backgroundColor: const Color(0XFFF7F9FA),
      drawer:
          MediaQuery.sizeOf(context).width < SizeConfig.tablet ? const CustomDrawer() : null,
      body: AdaptiveLayoutWidget(
        mobileLayout: (BuildContext context) => const DashboardMobileLayout(),
        tabletLayout: (BuildContext context) => const DashboardTabletLayout(),
        desktopLayout: (BuildContext context) => const DashboardDesktop(),
      ),
    );
  }
}
