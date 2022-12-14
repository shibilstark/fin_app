import 'package:fin_app/core/colors.dart';
import 'package:fin_app/core/dimensions.dart';
import 'package:fin_app/presentation/screens/login_screen/widgets/login_title.dart';
import 'package:flutter/material.dart';

class LoginLogoInfoWidget extends StatelessWidget {
  const LoginLogoInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const LoginTitleWidget(),
        AppSizeBox.h50(),
        Row(
          children: [
            const Expanded(
              child: Text(
                "Welcome to the App, Please Login",
                style: TextStyle(
                  color: AppColors.black,
                ),
              ),
            ),
            AppSizeBox.w10(),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.lightbulb,
                  size: 20,
                ))
          ],
        ),
      ],
    );
  }
}
