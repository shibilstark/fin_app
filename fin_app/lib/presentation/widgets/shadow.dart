import 'package:fin_app/core/colors.dart';
import 'package:fin_app/core/dimensions.dart';
import 'package:flutter/material.dart';

class ShadowWidget extends StatelessWidget {
  const ShadowWidget({
    Key? key,
    required this.child,
    this.color,
  }) : super(key: key);

  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: AppPaddings.kCommonSurroundingPadding,
      decoration: BoxDecoration(
          color: color ?? AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: AppColors.grey[300]!,
                offset: const Offset(0, 0),
                blurRadius: 1,
                spreadRadius: 2)
          ]),
      child: child,
    );
  }
}
