import 'package:fin_app/data/db/handler.dart';
import 'package:fin_app/domain/user/model/user_model.dart';
import 'package:fin_app/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fin_app/domain/user/user_repository/user_repository.dart';
import "package:injectable/injectable.dart";

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  @override
  Future<Either<bool, AppFailure>> deleteUser() async {
    try {
      final result = await LocalDbHandler.deleteUser();
      return Left(result);
    } catch (e) {
      return Right(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<UserModel?, AppFailure>> getUser() async {
    try {
      final result = await LocalDbHandler.getUser();
      return Left(result);
    } catch (e) {
      return Right(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<bool, AppFailure>> saveUser(UserModel userModel) async {
    try {
      final result = await LocalDbHandler.saveUser(userModel);
      return Left(result);
    } catch (e) {
      return Right(AppFailure(e.toString()));
    }
  }
}
