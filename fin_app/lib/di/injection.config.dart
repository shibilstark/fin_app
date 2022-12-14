// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/auth/auth_repository_impl.dart.dart' as _i4;
import '../data/connectivity/connectivity_repository_impl.dart' as _i6;
import '../data/dummy/dummy_repository_impl.dart' as _i8;
import '../data/users/users_repository_impl.dart' as _i10;
import '../domain/auth/auth_repository/auth_repository.dart' as _i3;
import '../domain/connectivity/connectivity_repository.dart' as _i5;
import '../domain/dummy/repository/dummy_repository.dart' as _i7;
import '../domain/user/user_repository/user_repository.dart' as _i9;
import '../presentation/logic/auth/auth_cubit.dart' as _i11;
import '../presentation/logic/dummy/dummy_cubit.dart' as _i12;
import '../presentation/logic/user/user_cubit.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.AuthRepository>(() => _i4.AuthRepositoryImpl());
  gh.lazySingleton<_i5.ConnectivityRepository>(
      () => _i6.ConnectivityRepostoryImpl());
  gh.lazySingleton<_i7.DummyRepository>(() => _i8.DummyRepositoryImpl());
  gh.lazySingleton<_i9.UserRepository>(() => _i10.UserRepositoryImpl());
  gh.factory<_i11.AuthCubit>(() => _i11.AuthCubit(
        get<_i3.AuthRepository>(),
        get<_i5.ConnectivityRepository>(),
      ));
  gh.factory<_i12.DummyCubit>(() => _i12.DummyCubit(
        get<_i7.DummyRepository>(),
        get<_i5.ConnectivityRepository>(),
      ));
  gh.factory<_i13.UserCubit>(() => _i13.UserCubit(get<_i9.UserRepository>()));
  return get;
}
