import 'package:fin_app/core/colors.dart';
import 'package:fin_app/core/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IsRightWidget extends StatelessWidget {
  const IsRightWidget({Key? key, required this.value, required this.label})
      : super(key: key);

  final bool value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Row(
        children: [
          Icon(
            Icons.done_all,
            size: 15,
            color: value ? AppColors.green : AppColors.red,
          ),
          AppSizeBox.w10(),
          Expanded(
              child: Text(
            label,
            style: TextStyle(
                fontSize: 13, color: value ? AppColors.green : AppColors.red),
          ))
        ],
      );
    });
  }
}
