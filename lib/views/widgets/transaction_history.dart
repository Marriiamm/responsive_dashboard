import 'package:flutter/material.dart';
import 'package:responsive_dash_board/models/transaction_model.dart';
import 'package:responsive_dash_board/utils/app_styles.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
              "Transaction History",
              style: AppStyles.styleSemiBold20(context),
            ),
            Text(
              "See All",
              style: AppStyles.styleRegular16(context)
                  .copyWith(color: const Color(0xff4EB7F2)),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "13 April 2022",
          style:
              AppStyles.styleRegular16(context).copyWith(color: const Color(0xffAAAAAA)),
        ),
        const SizedBox(
          height: 16,
        ),
        const TransactionHistoryListView(),
      ],
    );
  }
}

class TransactionItem extends StatelessWidget {
  const TransactionItem({super.key, required this.transactionModel});

  final TransactionModel transactionModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color(0xffFAFAFA),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(
          transactionModel.title,
          style: AppStyles.styleSemiBold16(context),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            transactionModel.date,
            style: AppStyles.styleRegular14(context).copyWith(
              color: const Color(0xffAAAAAA),
            ),
          ),
        ),
        trailing: Text(
          transactionModel.amount,
          style: AppStyles.styleSemiBold20(context).copyWith(
              color: transactionModel.isWithDrawal
                  ? const Color(0xffF3735E)
                  : const Color(0xff7CD87A)),
        ),
      ),
    );
  }
}

class TransactionHistoryListView extends StatelessWidget {
  const TransactionHistoryListView({super.key});

  static const items = [
    TransactionModel(
        title: "Cash Withdrawal",
        date: "13 April 2022",
        amount: r'$20,129',
        isWithDrawal: true),
    TransactionModel(
        title: "Landing Page Project",
        date: "13 April 2022 at 3:30 Pm",
        amount: r'$2000',
        isWithDrawal: false),
    TransactionModel(
        title: "Juni Mobile App Project",
        date: "13 April 2022 at 3:30 Pm",
        amount: r'$20,129',
        isWithDrawal: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((e) => TransactionItem(transactionModel: e)).toList(),
    );

    //  ListView.builder(
    //     shrinkWrap: true,
    //     itemCount: items.length,
    //     itemBuilder: (context, index) {
    //       return TransactionItem(transactionModel: items[index]);
    //     });
  }
}
