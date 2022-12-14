import 'package:dartz/dartz.dart';
import 'package:fin_app/domain/failures/failures.dart';
import 'package:fin_app/domain/user/model/user_model.dart';

abstract class UserRepository {
  Future<Either<bool, AppFailure>> saveUser(UserModel userModel);
  Future<Either<UserModel?, AppFailure>> getUser();
  Future<Either<bool, AppFailure>> deleteUser();
}
