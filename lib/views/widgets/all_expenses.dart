import 'package:flutter/material.dart';
import 'package:responsive_dash_board/utils/app_styles.dart';


import 'expenses_item.dart';

class AllExpenses extends StatelessWidget {
  const AllExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: const Column(
        children: [
          AllExpensesHeader(),
          SizedBox(
            height: 16,
          ),
          ExpensesItemsList(),
        ],
      ),
    );
  }
}

class AllExpensesHeader extends StatelessWidget {
  const AllExpensesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "All Expenses",
          style: AppStyles.styleSemiBold20,
        ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                width: 1,
                color: const Color(0XFFF1F1F1),
              )),
          child: const Row(
            children: [
              Text(
                "Monthly",
                style: AppStyles.styleMedium16,
              ),
              SizedBox(
                width: 18,
              ),
              Icon(
                Icons.arrow_drop_down_rounded,
                color: Color(0XFF064061),
              )
            ],
          ),
        )
      ],
    );
  }
}
