import 'package:fin_app/core/colors.dart';
import 'package:fin_app/core/dimensions.dart';
import 'package:fin_app/presentation/screens/home_screen/home_screen.dart';
import 'package:fin_app/presentation/screens/setting_sheet/setting_sheet.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: AppDimensions.kAppBarHeight,
          child: Padding(
            padding: AppPaddings.kCommonHorizontalPadding,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  const AppBarTitleWidget(),
                  const Spacer(),
                  IconButton(
                      onPressed: () async {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => SettingSheet(),
                        );
                      },
                      icon: const Icon(
                        Icons.settings,
                        color: AppColors.black,
                      ))
                ],
              ),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const HomeScreen(),
    );
  }
}

class AppBarTitleWidget extends StatelessWidget {
  const AppBarTitleWidget({
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
            fontSize: AppFontSize.title,
            fontWeight: AppFontWeights.bold,
            color: AppColors.black,
          ),
        ),
        RichText(
          text: const TextSpan(
            text: 'Flutter ',
            style: TextStyle(
              fontWeight: AppFontWeights.regular,
              fontSize: 16,
              color: AppColors.black,
            ),
            children: [
              TextSpan(
                text: 'Test',
                style: TextStyle(
                  fontWeight: AppFontWeights.regular,
                  fontSize: AppFontSize.medium,
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
