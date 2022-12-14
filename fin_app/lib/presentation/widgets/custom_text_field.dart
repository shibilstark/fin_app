import 'package:fin_app/core/colors.dart';
import 'package:fin_app/core/dimensions.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    Key? key,
    required this.controller,
    required this.label,
    this.onChanged,
    this.focusNode,
  }) : super(key: key);

  final String label;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      cursorColor: AppColors.grey,
      controller: controller,
      focusNode: focusNode,
      style: const TextStyle(
        letterSpacing: 1.2,
        color: AppColors.black,
        fontSize: AppFontSize.small,
      ),
      decoration: InputDecoration(
          label: Text(
            label,
            style: const TextStyle(
              color: AppColors.grey,
            ),
          ),
          // contentPadding: EdgeInsets.symmetric(
          //     vertical: 20, horizontal: 10),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
