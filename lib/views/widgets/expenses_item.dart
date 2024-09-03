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
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: const ShapeDecoration(
                    shape: OvalBorder(), color: Color(0XFFFAFAFA)),
                child: Image.asset(expensesItemModel.image),
              ),
              const SizedBox(
                width: 56,
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
          Text(
            expensesItemModel.title,
            style: AppStyles.styleSemiBold16,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            expensesItemModel.date,
            style: AppStyles.styleRegular14,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            expensesItemModel.price,
            style: AppStyles.styleSemiBold24,
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
              Container(
                width: 60,
                height: 60,
                decoration: ShapeDecoration(
                    shape: const OvalBorder(),
                    color: Colors.white.withOpacity(0.1)),
                child: Image.asset(expensesItemModel.image),
              ),
              const SizedBox(
                width: 56,
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
          Text(
            expensesItemModel.title,
            style: AppStyles.styleSemiBold16.copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            expensesItemModel.date,
            style: AppStyles.styleRegular14
                .copyWith(color: const Color(0xffFAFAFA)),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            expensesItemModel.price,
            style: AppStyles.styleSemiBold24.copyWith(color: Colors.white),
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

  int selectedIndex = 0;
  void updateIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children: items.asMap().entries.map((e) {
      int index = e.key;
      var item = e.value;
      if (index == 1) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              updateIndex(index);
              log(selectedIndex.toString());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ExpensesItem(
                expensesItemModel: item,
                isSelected: selectedIndex == index,
              ),
            ),
          ),
        );
      } else {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              updateIndex(index);
              log(selectedIndex.toString());
            },
            child: ExpensesItem(
              expensesItemModel: item,
              isSelected: selectedIndex == index,
            ),
          ),
        );
      }
    }).toList());
  }
}


