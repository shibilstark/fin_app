import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fin_app/domain/connectivity/connectivity_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ConnectivityRepository)
class ConnectivityRepostoryImpl implements ConnectivityRepository {
  @override
  Future<bool> checkConnectivity() async {
    final connection = await Connectivity().checkConnectivity();

    if (connection == ConnectivityResult.mobile ||
        connection == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
