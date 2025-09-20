import 'package:action_labs/utils/colors.dart';
import 'package:action_labs/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Column(
        children: [
          SvgPicture.asset(AppImages.logo, height: 44),
          Divider(color: AppColors.grey02, thickness: 2),
        ],
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
