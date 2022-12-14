import 'package:fin_app/domain/user/model/user_model.dart';
import 'package:hive_flutter/adapters.dart';

class AppLocalDB {
  static late final Box<UserModel> userBox;

  static initiallize() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(UserModelAdapter().typeId)) {
      Hive.registerAdapter(UserModelAdapter());
    }

    userBox = await Hive.openBox<UserModel>("user");
  }
}
