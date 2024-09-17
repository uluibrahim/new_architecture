import 'package:new_architecture/core/model/state_data.dart';

final class SettingsData extends StateData {
  const SettingsData({
    super.appState,
  });

  const SettingsData.initial();
  
  @override
  List<Object?> get props => [
        super.appState,
      ];
}
