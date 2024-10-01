import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import '../../error/exceptions/exceptions.dart';
import '/core/extensions/network_status_extension.dart';

import 'network_status.dart';

abstract class INetworkStatusManager {
  void checkNetworkFirstTime();
  void handleNetworkChange();
  Future<void> init();
}

@LazySingleton(as: INetworkStatusManager)
final class NetworkStatusManager extends INetworkStatusManager {
  late final Connectivity _connectivity;

  @override
  Future<void> init() async {
    _connectivity = Connectivity();
    await checkNetworkFirstTime();
    handleNetworkChange();
  }

  @override
  Future<void> checkNetworkFirstTime() async {
    final List<ConnectivityResult> connectivityResult =
        await _connectivity.checkConnectivity();

    _checkConnection(connectivityResult);
  }

  @override
  void handleNetworkChange() {
    _connectivity.onConnectivityChanged.listen(
      (event) => _checkConnection(event),
    );
  }

  void _checkConnection(List<ConnectivityResult> result) {
    bool isConnected =
        NetworkStatus.checkConnectivityResult(result).isConnected;

    isConnected ? null : throw NetworkStatusException();
  }
}
