import 'package:action_labs/utils/colors.dart';
import 'package:action_labs/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CopyrightBottom extends StatelessWidget {
  const CopyrightBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: AppColors.branded,
      alignment: Alignment.center,
      height: 30,
      padding: EdgeInsets.symmetric(vertical: 7),
      child: Text(
        'Copyright 2022 - Action Labs',
        style: TextStyles.xsmallRegular(color: Colors.white),
      ),
    );
  }
}
