// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:fin_app/core/dimensions.dart';
import 'package:fin_app/presentation/screens/login_screen/widgets/is_right.dart';
import 'package:flutter/material.dart';

class PasswordValidatorRowsWidget extends StatelessWidget {
  const PasswordValidatorRowsWidget({
    Key? key,
    required this.controllerNotifier,
    required this.digitExist,
    required this.capitalExist,
    required this.smallExist,
    required this.specialExist,
    required this.lengthExist,
  }) : super(key: key);

  final ValueNotifier<TextEditingController> controllerNotifier;
  final ValueNotifier<bool> digitExist;
  final ValueNotifier<bool> capitalExist;
  final ValueNotifier<bool> smallExist;
  final ValueNotifier<bool> specialExist;
  final ValueNotifier<bool> lengthExist;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder(
            valueListenable: controllerNotifier,
            builder: (context, con, _) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ValueListenableBuilder(
                        valueListenable: digitExist,
                        builder: (context, bool val, _) {
                          return IsRightWidget(
                              value: val, label: "Contain atleast 1 digit");
                        }),
                    AppSizeBox.h5(),
                    ValueListenableBuilder(
                        valueListenable: capitalExist,
                        builder: (context, bool val, _) {
                          return IsRightWidget(
                              value: val,
                              label: "Contain atleast 1 capital letter");
                        }),
                    AppSizeBox.h5(),
                    ValueListenableBuilder(
                        valueListenable: smallExist,
                        builder: (context, bool val, _) {
                          return IsRightWidget(
                              value: val,
                              label: "Contain atleast 1 small letter");
                        }),
                    AppSizeBox.h5(),
                    ValueListenableBuilder(
                        valueListenable: specialExist,
                        builder: (context, bool val, _) {
                          return IsRightWidget(
                              value: val,
                              label:
                                  "Contain atleast 1 special charecter ( _, @, ., /, #, &, +, - )");
                        }),
                    AppSizeBox.h5(),
                    ValueListenableBuilder(
                        valueListenable: lengthExist,
                        builder: (context, bool val, _) {
                          return IsRightWidget(
                              value: val, label: "Maximum length 7");
                        }),
                  ],
                ),
              );
            }),
      ],
    );
  }
}
