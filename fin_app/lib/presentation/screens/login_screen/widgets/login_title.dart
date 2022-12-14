import 'package:fin_app/core/colors.dart';
import 'package:fin_app/core/dimensions.dart';
import 'package:flutter/material.dart';

class LoginTitleWidget extends StatelessWidget {
  const LoginTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Fin Infocom",
          style: TextStyle(
            fontSize: AppFontSize.bigTitle,
            fontWeight: AppFontWeights.bold,
            color: AppColors.black,
          ),
        ),
        RichText(
          text: const TextSpan(
            text: 'Flutter ',
            style: TextStyle(
              fontWeight: AppFontWeights.regular,
              fontSize: AppFontSize.veryLarge,
              color: AppColors.black,
            ),
            children: [
              TextSpan(
                text: 'Test',
                style: TextStyle(
                  fontWeight: AppFontWeights.regular,
                  fontSize: AppFontSize.veryLarge,
                  color: AppColors.blue,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
