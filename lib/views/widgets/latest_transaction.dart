import 'package:flutter/material.dart';
import 'package:responsive_dash_board/models/user_info_model.dart';
import 'package:responsive_dash_board/utils/app_images.dart';
import 'package:responsive_dash_board/views/widgets/user_info_list.dart';

import '../../utils/app_styles.dart';

class LatestTransaction extends StatelessWidget {
  const LatestTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Latest Transactions",
          style: AppStyles.styleMedium16,
        ),
        SizedBox(
          height: 6,
        ),
        LatestTransactionListView(),
      ],
    );
  }
}

class LatestTransactionListView extends StatelessWidget {
  const LatestTransactionListView({super.key});

  static const items = [
    UserInfoModel(
        image: Assets.assetsIconsLightFace,
        title: "Madrani Andi",
        subTitle: "Madraniandi@gmail.com"),
    UserInfoModel(
        image: Assets.assetsIconsFace,
        title: "Madrani Andi",
        subTitle: "Madraniandi@gmail.com"),
    UserInfoModel(
        image: Assets.assetsIconsLightFace,
        title: "Madrani Andi",
        subTitle: "Madraniandi@gmail.com"),
  ];

  @override
  Widget build(BuildContext context) {
     return 
    //  SingleChildScrollView(
    //   scrollDirection: Axis.horizontal,
    //   child: Row(
    //     children: items.map((e)=> IntrinsicWidth(
    //           child: Card(
    //             color: const Color(0xffFAFAFA),
    //             elevation: 0,
    //             child: Center(
    //               child: UserInfoList(
    //                 userInfoo: e,
    //               ),
    //             ),
    //           ),
    //         )).toList(),
    //   ),
    //  );
    SizedBox(
      height: 77,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return IntrinsicWidth(
              child: Card(
                color: Color(0xffFAFAFA),
                elevation: 0,
                child: Center(
                  child: UserInfoList(
                    userInfoo: items[index],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
