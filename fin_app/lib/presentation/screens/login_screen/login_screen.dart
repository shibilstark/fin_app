// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'dart:developer';
import 'package:fin_app/core/colors.dart';
import 'package:fin_app/core/dimensions.dart';
import 'package:fin_app/data/auth/auth_repository_impl.dart.dart';
import 'package:fin_app/domain/auth/model/auth_model.dart';
import 'package:fin_app/presentation/logic/auth/auth_cubit.dart';
import 'package:fin_app/presentation/logic/dummy/dummy_cubit.dart';
import 'package:fin_app/presentation/routes/router.dart';
import 'package:fin_app/presentation/screens/login_screen/widgets/is_right.dart';
import 'package:fin_app/presentation/screens/login_screen/widgets/login_info.dart';
import 'package:fin_app/presentation/screens/login_screen/widgets/password_validator_rows.dart';
import 'package:fin_app/presentation/widgets/custom_text_field.dart';
import 'package:fin_app/presentation/widgets/shadow.dart';
import 'package:flutter/material.dart';
import 'package:fin_app/utils/extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final ValueNotifier<bool> digitExist;
  late final ValueNotifier<bool> userNameCheck;
  late final ValueNotifier<bool> lengthExist;
  late final ValueNotifier<bool> capitalExist;
  late final ValueNotifier<bool> smallExist;
  late final ValueNotifier<bool> specialExist;
  late final ValueNotifier<TextEditingController> passwordControllerNotifier;
  late final ValueNotifier<TextEditingController> usernameControllerNotifier;

  @override
  void initState() {
    passwordControllerNotifier = ValueNotifier(TextEditingController());
    usernameControllerNotifier = ValueNotifier(TextEditingController());
    digitExist = ValueNotifier(false);
    userNameCheck = ValueNotifier(false);
    lengthExist = ValueNotifier(false);
    capitalExist = ValueNotifier(false);
    smallExist = ValueNotifier(false);
    specialExist = ValueNotifier(false);
    super.initState();
  }

  _notifyListeners(String text) {
    if (text.trim().isContainOneCapitalLetter()) {
      capitalExist.value = true;
    } else {
      capitalExist.value = false;
    }

    if (text.trim().isContainOneDigit()) {
      digitExist.value = true;
    } else {
      digitExist.value = false;
    }
    if (text.trim().isContainOneSpecialCharecter()) {
      specialExist.value = true;
    } else {
      specialExist.value = false;
    }
    if (text.trim().length == 7) {
      lengthExist.value = true;
    } else {
      lengthExist.value = false;
    }
    if (text.trim().isContainOneSmallLetter()) {
      smallExist.value = true;
    } else {
      smallExist.value = false;
    }
    passwordControllerNotifier.notifyListeners();
    capitalExist.notifyListeners();
    smallExist.notifyListeners();
    lengthExist.notifyListeners();
    specialExist.notifyListeners();
    digitExist.notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: Container(
        padding: AppPaddings.kCommonSurroundingPadding,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LoginLogoInfoWidget(),
              Padding(
                padding: AppPaddings.kCommonVerticalPadding,
                child: ShadowWidget(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Text(
                          "LOGIN",
                          style: TextStyle(
                            fontSize: AppFontSize.medium,
                            color: AppColors.black,
                            fontWeight: AppFontWeights.semiBold,
                          ),
                        ),
                        AppSizeBox.h20(),
                        CustomTextFieldWidget(
                          onChanged: (text) {
                            if (text.trim().length == 10) {
                              userNameCheck.value = true;
                            } else {
                              userNameCheck.value = false;
                            }
                          },
                          controller: usernameControllerNotifier.value,
                          label: "User Name",
                        ),
                        AppSizeBox.h5(),
                        ValueListenableBuilder(
                            valueListenable: userNameCheck,
                            builder: (context, bool val, _) {
                              return IsRightWidget(
                                  value: val,
                                  label: "Username must be 10 charecters");
                            }),
                        AppSizeBox.h5(),
                        AppSizeBox.h20(),
                        CustomTextFieldWidget(
                          onChanged: (text) {
                            _notifyListeners(text);
                          },
                          controller: passwordControllerNotifier.value,
                          label: "Password",
                        ),
                        AppSizeBox.h20(),
                        PasswordValidatorRowsWidget(
                          controllerNotifier: passwordControllerNotifier,
                          digitExist: digitExist,
                          capitalExist: capitalExist,
                          smallExist: smallExist,
                          specialExist: specialExist,
                          lengthExist: lengthExist,
                        ),
                        AppSizeBox.h50(),
                        LoginButtonWidget(
                          usernameControllerNotifier:
                              usernameControllerNotifier,
                          passwordControllerNotifier:
                              passwordControllerNotifier,
                          capitalExist: capitalExist,
                          userNameCheck: userNameCheck,
                          digitExist: digitExist,
                          specialExist: specialExist,
                          lengthExist: lengthExist,
                          smallExist: smallExist,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    Key? key,
    required this.usernameControllerNotifier,
    required this.passwordControllerNotifier,
    required this.capitalExist,
    required this.userNameCheck,
    required this.digitExist,
    required this.specialExist,
    required this.lengthExist,
    required this.smallExist,
  }) : super(key: key);

  final ValueNotifier<TextEditingController> usernameControllerNotifier;
  final ValueNotifier<TextEditingController> passwordControllerNotifier;
  final ValueNotifier<bool> capitalExist;
  final ValueNotifier<bool> userNameCheck;
  final ValueNotifier<bool> digitExist;
  final ValueNotifier<bool> specialExist;
  final ValueNotifier<bool> lengthExist;
  final ValueNotifier<bool> smallExist;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: usernameControllerNotifier,
        builder: (context, val1, _) {
          return ValueListenableBuilder(
              valueListenable: passwordControllerNotifier,
              builder: (context, val, _) {
                return BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSuccess) {
                      context.read<DummyCubit>().getDummyDatas();
                      AppNavigator.pushReplacement(
                          context, AppRouter.MAIN_SCREEN);
                    }
                    if (state is AuthError) {
                      Fluttertoast.showToast(msg: state.failure.message);
                    }
                  },
                  builder: (context, state) {
                    return InkWell(
                      onTap: () {
                        if (capitalExist.value &&
                            userNameCheck.value &&
                            digitExist.value &&
                            specialExist.value &&
                            lengthExist.value &&
                            smallExist.value) {
                          context.read<AuthCubit>().login(
                              username:
                                  usernameControllerNotifier.value.text.trim(),
                              password:
                                  passwordControllerNotifier.value.text.trim());
                        }
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color: capitalExist.value &&
                                  userNameCheck.value &&
                                  digitExist.value &&
                                  specialExist.value &&
                                  lengthExist.value &&
                                  smallExist.value
                              ? AppColors.black
                              : AppColors.blueGrey,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 40),
                          child: state is AuthLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                      color: AppColors.white),
                                )
                              : Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      "Login",
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: AppFontWeights.semiBold,
                                      ),
                                    ),
                                    AppSizeBox.w10(),
                                    const Icon(
                                      Icons.keyboard_arrow_right,
                                      color: AppColors.white,
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    );
                  },
                );
              });
        });
  }
}
