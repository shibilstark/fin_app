import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:fin_app/domain/failures/failures.dart';
import 'package:fin_app/domain/user/model/user_model.dart';
import 'package:fin_app/domain/user/user_repository/user_repository.dart';
import 'package:injectable/injectable.dart';
part 'user_state.dart';

@injectable
class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepository) : super(UserInitial());

  final UserRepository userRepository;

  void getUser() async {
    emit(UserLoading());
    final result = await userRepository.getUser();

    result.fold((user) {
      if (user == null) {
        emit(UserNotFound());
      } else {
        emit(UserSuccess(user));
      }
    }, (err) {
      emit(UserError(err));
    });
  }

  void logout() async {
    final result = await userRepository.deleteUser();
    result.fold((deleted) {
      emit(UserNotFound());
    }, (err) {
      emit(UserError(err));
    });
  }

  void saveUser(UserModel userModel) async {
    final result = await userRepository.saveUser(userModel);
    result.fold((saved) {
      emit(UserSuccess(userModel));
    }, (err) {
      emit(UserError(err));
    });
  }
}
