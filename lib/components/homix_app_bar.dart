import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:homix/theme/app_colors.dart';
import 'package:homix/typography/text_style.dart';


class HomixAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomixAppBar({
    super.key,
    required this.screenName
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final String screenName;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () => context.router.pop(),
          icon: Icon(
            Icons.arrow_back,
            color: HomixColors.whiteColor,
          )),
      backgroundColor: HomixColors.backgroundColor,
      title: Center(
        child: Text(
          screenName,
          style: AppTextStyle.appTitle
              .copyWith(color: HomixColors.whiteColor, fontSize: 20),
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: HomixColors.whiteColor,
            ))
      ],
      elevation: 0,
    );
  }
}
