import 'package:flutter/material.dart';

import 'widgets/all_expenses.dart';
import 'widgets/customcontainer_background.dart';
import 'widgets/income_section.dart';
import 'widgets/my_card.dart';
import 'widgets/quick_invoice.dart';
import 'widgets/transaction_history.dart';

class DashboardMobileLayout extends StatelessWidget {
  const DashboardMobileLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              AllExpenses(),
              SizedBox(
                height: 16,
              ),
              QuickInvoice(),
              SizedBox(
                height: 20,
              ),
              CustomContainer(
                child: Column(
                  children: [
                    MyCard(),
                    Divider(
                      height: 40,
                      color: Color(0xffF1F1F1),
                    ),
                    TransactionHistory(),
                    SizedBox(
                      height: 16,
                    ),
                    IncomeSection(),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
