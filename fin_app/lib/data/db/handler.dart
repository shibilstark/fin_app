import 'dart:developer';

import 'package:fin_app/data/db/db.dart';

import 'package:fin_app/domain/user/model/user_model.dart';
import 'package:injectable/injectable.dart';

class LocalDbHandler {
  static final box = AppLocalDB.userBox;

  static Future<bool> saveUser(UserModel userModel) async {
    await box.clear();
    await box.add(userModel);
    return true;
  }

  static Future<bool> deleteUser() async {
    await box.clear();
    return true;
  }

  static Future<UserModel?> getUser() async {
    if (box.isEmpty) {
      return null;
    } else {
      return box.values.first;
    }
  }
}
