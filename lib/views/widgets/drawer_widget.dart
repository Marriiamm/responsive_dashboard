import 'package:flutter/material.dart';
import 'package:responsive_dash_board/models/drawer_item_model.dart';
import 'package:responsive_dash_board/models/user_info_model.dart';
import 'package:responsive_dash_board/utils/app_images.dart';
import 'package:responsive_dash_board/views/widgets/user_info_list.dart';

import 'drawerItemsListView.dart';
import 'drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width*0.7,
      color: Colors.white,
      child: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Card(
              color: Color(0xffFAFAFA),
              elevation: 0,
              child: UserInfoList(
                userInfoo: UserInfoModel(
                    image: Assets.assetsIconsBig,
                    title: "Lekan Okeowo",
                    subTitle: "demo@gmail.com"),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 8,
            ),
          ),
          DrawerItemsList(),
          SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  Expanded(
                      child: SizedBox(
                    height: 12,
                  )),
                  InActiveDrawerItem(
                    drawerItem: DrawerItemModel(
                        title: "Setting", image: Assets.assetsIconsSetting2),
                  ),
                  InActiveDrawerItem(
                    drawerItem: DrawerItemModel(
                        title: "Logout Account",
                        image: Assets.assetsIconsLogout),
                  ),
                  SizedBox(
                    height: 48,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
