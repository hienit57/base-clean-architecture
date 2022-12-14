import 'dart:async';

import 'package:connectivity/connectivity.dart';

class NetworkChecker {
  static Future<bool> checkNetwork() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}