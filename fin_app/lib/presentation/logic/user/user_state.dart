part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserError extends UserState {
  final AppFailure failure;

  const UserError(this.failure);
  @override
  List<Object> get props => [failure];
}

class UserNotFound extends UserState {}

class UserSuccess extends UserState {
  final UserModel userModel;

  const UserSuccess(this.userModel);
  @override
  List<Object> get props => [userModel];
}
