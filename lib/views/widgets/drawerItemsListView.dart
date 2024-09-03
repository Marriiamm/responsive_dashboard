import 'package:flutter/material.dart';

import '../../models/drawer_item_model.dart';
import '../../utils/app_images.dart';
import 'drawer_item.dart';

class DrawerItemsList extends StatefulWidget {
  const DrawerItemsList({
    super.key,
  });

  @override
  State<DrawerItemsList> createState() => _DrawerItemsListState();
}

class _DrawerItemsListState extends State<DrawerItemsList> {
  final List<DrawerItemModel> items = const [
    DrawerItemModel(image: Assets.assetsIconsCategory2, title: "Dashboard"),
    DrawerItemModel(
        image: Assets.assetsIconsConvertCardd, title: "My Transactions"),
    DrawerItemModel(image: Assets.assetsIconsGraph, title: "Statistics"),
    DrawerItemModel(image: Assets.assetsIconsWallet2, title: "Wallet Account"),
    DrawerItemModel(image: Assets.assetsIconsChart2, title: "My Investments"),
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (activeIndex != index) {
  setState(() {
    activeIndex = index;
  });
}
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: DrawerItem(
              drawerItem: items[index],
              isActive: activeIndex == index,
            ),
          ),
        );
      },
    );
  }
}
