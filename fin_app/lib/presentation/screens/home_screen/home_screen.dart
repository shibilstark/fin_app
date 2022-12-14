import 'package:fin_app/core/assets.dart';
import 'package:fin_app/core/colors.dart';
import 'package:fin_app/core/dimensions.dart';
import 'package:fin_app/presentation/logic/dummy/dummy_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.kCommonSurroundingPadding,
      child: BlocBuilder<DummyCubit, DummyState>(
        builder: (context, state) {
          if (state is DummyError) {
            return Container(
              constraints: BoxConstraints(minHeight: 200),
              child: Align(
                  child: Column(
                children: [
                  Text(state.failure.message),
                  AppSizeBox.h20(),
                  IconButton(
                      onPressed: () {
                        context.read<DummyCubit>().getDummyDatas();
                      },
                      icon: Icon(Icons.replay))
                ],
              )),
            );
          }
          if (state is DummySuccess) {
            return ListView.separated(
                itemBuilder: (context, index) => ListTile(
                      dense: true,
                      leading: CircleAvatar(
                        backgroundColor: AppColors.red,
                        child: SvgPicture.asset(AppImageAssets.avatar),
                      ),
                      title: Text(
                        state.dummyDatas[index].name,
                        style: const TextStyle(
                          color: AppColors.black,
                          fontSize: AppFontSize.medium,
                        ),
                      ),
                      subtitle: Text(
                        state.dummyDatas[index].city,
                        style: const TextStyle(
                          color: AppColors.grey,
                          fontSize: AppFontSize.verySmall,
                        ),
                      ),
                      trailing: Text("Age: ${state.dummyDatas[index].age}"),
                    ),
                separatorBuilder: (context, index) => AppSizeBox.h20(),
                itemCount: state.dummyDatas.length);
          }
          return const Center(
            child: SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
