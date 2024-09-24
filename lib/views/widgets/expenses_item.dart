import 'dart:developer';

import 'package:flutter/material.dart';

import '../../models/expenses_item_model.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem(
      {super.key, required this.expensesItemModel, required this.isSelected});

  final ExpensesItemModel expensesItemModel;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveExItem(
            expensesItemModel: expensesItemModel,
          )
        : InActiveExItem(
            expensesItemModel: expensesItemModel,
          );
  }
}

class InActiveExItem extends StatelessWidget {
  const InActiveExItem({
    super.key,
    required this.expensesItemModel,
  });

  final ExpensesItemModel expensesItemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: const Color(0XFFF1F1F1))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 60,
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: const ShapeDecoration(
                          shape: OvalBorder(), color: Color(0XFFFAFAFA)),
                      child:
                          Center(child: Image.asset(expensesItemModel.image)),
                    ),
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Color(0XFF064061),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              expensesItemModel.title,
              style: AppStyles.styleSemiBold16(context),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              expensesItemModel.date,
              style: AppStyles.styleRegular14(context),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              expensesItemModel.price,
              style: AppStyles.styleSemiBold24(context),
            ),
          ),
        ],
      ),
    );
  }
}

class ActiveExItem extends StatelessWidget {
  const ActiveExItem({
    super.key,
    required this.expensesItemModel,
  });

  final ExpensesItemModel expensesItemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xff4EB7F2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 60,
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: ShapeDecoration(
                          shape: const OvalBorder(),
                          color: Colors.white.withOpacity(0.1)),
                      child:
                          Center(child: Image.asset(expensesItemModel.image)),
                    ),
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Color.fromARGB(255, 255, 255, 255),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              expensesItemModel.title,
              style: AppStyles.styleSemiBold16(context)
                  .copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              expensesItemModel.date,
              style: AppStyles.styleRegular14(context)
                  .copyWith(color: const Color(0xffFAFAFA)),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              expensesItemModel.price,
              style: AppStyles.styleSemiBold24(context)
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class ExpensesItemsList extends StatefulWidget {
  const ExpensesItemsList({super.key});

  @override
  State<ExpensesItemsList> createState() => _ExpensesItemsListState();
}

class _ExpensesItemsListState extends State<ExpensesItemsList> {
  final items = [
    const ExpensesItemModel(
        image: Assets.assetsIconsMoneys,
        title: "Balance",
        date: "April 2022",
        price: r"$20,129"),
    const ExpensesItemModel(
        image: Assets.assetsIconsCardReceive,
        title: "Income",
        date: "April 2022",
        price: r"$20,129"),
    const ExpensesItemModel(
        image: Assets.assetsIconsCardSend,
        title: "Expenses",
        date: "April 2022",
        price: r"$20,129"),
  ];

  void updateIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: GestureDetector(
          onTap: () {
            updateIndex(0);
            log(selectedIndex.toString());
          },
          child: ExpensesItem(
            expensesItemModel: items[0],
            isSelected: selectedIndex == 0,
          ),
        ),
      ),
      const SizedBox(width: 8,),
      Expanded(
        child: GestureDetector(
          onTap: () {
            updateIndex(1);
            log(selectedIndex.toString());
          },
          child: ExpensesItem(
            expensesItemModel: items[1],
            isSelected: selectedIndex == 1,
          ),
        ),
      ),
      const SizedBox(width: 8,),
      Expanded(
        child: GestureDetector(
          onTap: () {
            updateIndex(2);
            log(selectedIndex.toString());
          },
          child: ExpensesItem(
            expensesItemModel: items[2],
            isSelected: selectedIndex == 2,
          ),
        ),
      )
    ]);
  }
}
