import 'package:connectivity_plus/connectivity_plus.dart';

enum NetworkStatus {
  on,
  off;

  static NetworkStatus checkConnectivityResult(
      List<ConnectivityResult> result) {
    result.first;

    if (_checkContains(result)) {
      return NetworkStatus.on;
    } else {
      return NetworkStatus.off;
    }
  }

  static _checkContains(List<ConnectivityResult> result) {
    return result.contains(ConnectivityResult.ethernet) ||
        result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.mobile);
  }
}
