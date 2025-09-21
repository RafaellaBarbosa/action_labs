import 'package:action_labs/utils/colors.dart';
import 'package:action_labs/utils/text_styles.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  const ButtonWidget({super.key, this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        backgroundColor: AppColors.branded,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      ),
      child: Text(label, style: TextStyles.buttonText(color: Colors.white)),
    );
  }
}
