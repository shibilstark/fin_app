import 'dart:developer';

import 'package:fin_app/core/colors.dart';
import 'package:fin_app/core/dimensions.dart';
import 'package:fin_app/presentation/logic/dummy/dummy_cubit.dart';
import 'package:fin_app/presentation/logic/user/user_cubit.dart';
import 'package:fin_app/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserCubit>().getUser();
    });

    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocListener<UserCubit, UserState>(
        listener: (context, state) {
          if (state is UserSuccess) {
            log('state user sucess');
            context.read<DummyCubit>().getDummyDatas();
            AppNavigator.pushReplacement(context, AppRouter.MAIN_SCREEN);
          } else {
            log('$state');
            AppNavigator.pushReplacement(context, AppRouter.LOGIN_SCREEN);
          }
        },
        child: Container(
          padding: AppPaddings.kCommonSurroundingPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.grey[300]!,
                          blurRadius: 2,
                          spreadRadius: 2,
                          offset: const Offset(2, 2))
                    ],
                    color: AppColors.grey[100],
                  ),
                  padding: AppPaddings.dynamicPadding(H: 35, V: 20),
                  child: const Text(
                    "F",
                    style: TextStyle(
                      fontSize: AppFontSize.splash,
                      fontWeight: AppFontWeights.bold,
                      color: AppColors.blue,
                    ),
                  ),
                ),
              ),
              AppSizeBox.h20(),
              const Text("Fin Infocom Flutter Test",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppFontSize.medium,
                    fontWeight: AppFontWeights.regular,
                    color: AppColors.black,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
