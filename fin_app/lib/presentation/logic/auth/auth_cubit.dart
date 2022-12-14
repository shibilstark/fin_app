import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fin_app/core/strings.dart';
import 'package:fin_app/domain/auth/auth_repository/auth_repository.dart';
import 'package:fin_app/domain/auth/model/auth_model.dart';
import 'package:fin_app/domain/connectivity/connectivity_repository.dart';
import 'package:fin_app/domain/failures/failures.dart';
import 'package:fin_app/domain/user/model/user_model.dart';
import 'package:fin_app/presentation/logic/bloc_provider_singleton.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository, this.connectivityRepository)
      : super(AuthInitial());

  final AuthRepository authRepository;
  final ConnectivityRepository connectivityRepository;

  void login({required String username, required String password}) async {
    emit(AuthLoading());
    final connection = await connectivityRepository.checkConnectivity();

    if (connection) {
      final model = UserModel(
          id: const Uuid().v4(),
          username: username.trim(),
          password: password.trim());
      await authRepository.login(model).then((result) {
        result.fold((auth) {
          BlocProviderSingleton.instance.userCubit.saveUser(auth);
          emit(AuthSuccess());
        }, (err) {
          emit(AuthError(err));
        });
      });
    } else {
      emit(const AuthError(AppFailure(AppErrorStrings.noInternet)));
    }
  }
}
