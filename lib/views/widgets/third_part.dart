import 'package:flutter/material.dart';
import 'package:responsive_dash_board/views/widgets/my_card.dart';

import 'customcontainer_background.dart';
import 'income_section.dart';
import 'transaction_history.dart';

class ThirdPrt extends StatelessWidget {
  const ThirdPrt({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
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
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Expanded(child: IncomeSection()),
      ],
    );
  }
}
