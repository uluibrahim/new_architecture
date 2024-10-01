import '../utils/network_status/network_status.dart';

extension NetworkResultExtension on NetworkStatus {
  bool get isConnected => this == NetworkStatus.on;
}
