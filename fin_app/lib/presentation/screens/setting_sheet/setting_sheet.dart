import 'package:fin_app/core/colors.dart';
import 'package:fin_app/core/dimensions.dart';
import 'package:fin_app/presentation/logic/dummy/dummy_cubit.dart';
import 'package:fin_app/presentation/logic/user/user_cubit.dart';
import 'package:fin_app/presentation/routes/router.dart';
import 'package:fin_app/presentation/screens/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SettingSheet extends StatelessWidget {
  const SettingSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      height: size.height * 0.5,
      child: SingleChildScrollView(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Sort",
                style: TextStyle(
                  fontSize: AppFontSize.large,
                  color: AppColors.black,
                ),
              ),
              BlocConsumer<UserCubit, UserState>(
                listener: (context, state) {
                  if (state is UserNotFound) {
                    AppNavigator.pushReplacement(
                        context, AppRouter.LOGIN_SCREEN);
                  }

                  if (state is UserError) {
                    Fluttertoast.showToast(msg: state.failure.message);
                  }
                },
                builder: (context, state) {
                  return TextButton.icon(
                      onPressed: () {
                        context.read<UserCubit>().logout();
                      },
                      icon: state is UserLoading
                          ? Icon(Icons.replay)
                          : Icon(Icons.logout),
                      label: Text("Logout"));
                },
              )
            ],
          ),
          BlocBuilder<DummyCubit, DummyState>(
            builder: (context, state) {
              if (state is DummySuccess) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: state.sortType,
                          groupValue: SortTypes.city,
                          onChanged: (value) {
                            context.read<DummyCubit>().sort(SortTypes.city);
                            AppNavigator.pop(context);
                          },
                        ),
                        AppSizeBox.w10(),
                        const Text(
                          "By city",
                          style: TextStyle(
                            fontSize: AppFontSize.small,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                    AppSizeBox.h10(),
                    Row(
                      children: [
                        Radio(
                          value: state.sortType,
                          groupValue: SortTypes.age,
                          onChanged: (value) {
                            context.read<DummyCubit>().sort(SortTypes.age);
                            AppNavigator.pop(context);
                          },
                        ),
                        AppSizeBox.w10(),
                        const Text(
                          "By age",
                          style: TextStyle(
                            fontSize: AppFontSize.small,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                    AppSizeBox.h10(),
                    Row(
                      children: [
                        Radio(
                          value: state.sortType,
                          groupValue: SortTypes.name,
                          onChanged: (value) {
                            context.read<DummyCubit>().sort(SortTypes.name);
                            AppNavigator.pop(context);
                          },
                        ),
                        AppSizeBox.w10(),
                        const Text(
                          "By name",
                          style: TextStyle(
                            fontSize: AppFontSize.small,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return SizedBox();
              }
            },
          ),
          AppSizeBox.h10(),
        ],
      )),
    );
  }
}
