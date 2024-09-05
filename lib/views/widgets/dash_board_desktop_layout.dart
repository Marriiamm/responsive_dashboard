import 'package:flutter/material.dart';
import 'package:responsive_dash_board/views/widgets/all_expenses.dart';
import 'package:responsive_dash_board/views/widgets/drawer_widget.dart';
import 'package:responsive_dash_board/views/widgets/quick_invoice.dart';

import 'third_part.dart';

class DashboardDesktop extends StatelessWidget {
  const DashboardDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          Expanded(child: CustomDrawer()),
          SizedBox(width: 16,),
          Expanded(
            flex: 2,
            child: Column(
            children: [
              SizedBox(height: 20,),
              AllExpenses(),
              SizedBox(height: 16,),
              QuickInvoice()
            ],
          )),
          SizedBox(width: 16,),
          Expanded(child: ThirdPrt()),
        ],
      ),
    );
  }
}