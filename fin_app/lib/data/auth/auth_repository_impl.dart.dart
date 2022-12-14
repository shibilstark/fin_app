import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fin_app/core/collections.dart';
import 'package:fin_app/domain/auth/auth_repository/auth_repository.dart';
import 'package:fin_app/domain/auth/model/auth_model.dart';
import 'package:fin_app/domain/failures/failures.dart';
import 'package:fin_app/domain/user/model/user_model.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<UserModel, AppFailure>> login(UserModel model) async {
    try {
      // What Iam doing here, creating for now just creating a field in firestore, that way Iam Authorizing

      bool foundEmail = false;
      bool foundPassword = false;

      UserModel? user;
      final doc = await FirebaseFirestore.instance
          .collection(FireStoreCollectionKeys.user)
          .get();

      final users = doc.docs.map((e) => UserModel.fromMap(e.data())).toList();

      users.forEach((element) {
        if (element.username == model.username.trim()) {
          foundEmail = true;
          if (element.password == model.password) {
            foundPassword = true;
            user = element;
            return;
          }
        }
      });

      if (foundPassword && foundEmail) {
        return Left(user!);
      }

      if (foundEmail) {
        return const Right(
            AppFailure("Please check you password, and try again"));
      }

      return const Right(
          AppFailure("Double check your username and password and try again"));
    } on FirebaseException catch (e) {
      log(e.toString());
      return Right(AppFailure(e.toString()));
    } catch (e) {
      return const Right(AppFailure("Some thing went wrong, try again later"));
    }
  }
}
