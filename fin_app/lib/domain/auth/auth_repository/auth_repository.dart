import 'package:dartz/dartz.dart';
import 'package:fin_app/domain/auth/model/auth_model.dart';

import 'package:fin_app/domain/failures/failures.dart';
import 'package:fin_app/domain/user/model/user_model.dart';

abstract class AuthRepository {
  Future<Either<UserModel, AppFailure>> login(UserModel model);
}
