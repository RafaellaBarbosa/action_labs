import 'package:action_labs/utils/colors.dart';
import 'package:action_labs/utils/text_styles.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const TextFormFieldWidget({
    super.key,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: "Enter the currency code",
        labelStyle: TextStyles.formText(),
        floatingLabelStyle: TextStyle(color: Colors.blue),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey02, width: 1),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey02, width: 1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
        fillColor: AppColors.grey03,
        filled: true,
      ),
    );
  }
}
