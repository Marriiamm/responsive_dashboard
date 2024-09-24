import 'package:flutter/material.dart';
import 'package:responsive_dash_board/models/user_info_model.dart';
import 'package:responsive_dash_board/utils/app_styles.dart';

class UserInfoList extends StatelessWidget {
  const UserInfoList({
    super.key,
    required this.userInfoo,
  });
  final UserInfoModel userInfoo;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(userInfoo.image),
      title: FittedBox(
        alignment: Alignment.centerLeft,
        fit: BoxFit.scaleDown,
        child: Text(
          userInfoo.title,
          style: AppStyles.styleSemiBold16(context),
        ),
      ),
      subtitle: FittedBox(
        alignment: Alignment.centerLeft,
        fit: BoxFit.scaleDown,
        child: Text(
          userInfoo.subTitle,
          style: AppStyles.styleRegular12(context),
        ),
      ),
    );
  }
}
