import 'package:fin_app/di/injection.dart';
import 'package:fin_app/presentation/logic/auth/auth_cubit.dart';
import 'package:fin_app/presentation/logic/dummy/dummy_cubit.dart';
import 'package:fin_app/presentation/logic/user/user_cubit.dart';

class BlocProviderSingleton {
  static final BlocProviderSingleton instance =
      BlocProviderSingleton._internal();
  factory BlocProviderSingleton() => instance;
  BlocProviderSingleton._internal();
  late final AuthCubit authCubit;
  late final UserCubit userCubit;
  late final DummyCubit dummyCubit;

  static initialize() {
    instance.authCubit = getIt<AuthCubit>();
    instance.userCubit = getIt<UserCubit>();
    instance.dummyCubit = getIt<DummyCubit>();
  }
}
