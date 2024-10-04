import 'package:injectable/injectable.dart';
import '../../product/enum/languages.dart';
import '../../product/providers/app_provider.dart';
import '../settings/settings_data.dart';

import '../../core/enum/app_state.dart';
import '../../core/view_model/view_model.dart';

@injectable
class SettingsViewModel extends ViewModel<SettingsData> {
  final IAppProvider _appProvider;

  SettingsViewModel(
    this._appProvider,
  ) : super(const SettingsData.initial());

  Future<void> changeLanguage(Languages languages) async {
    await _appProvider.changeLanguage(languages);
  }

  Future<void> changeThemeMode() async {
    await _appProvider.changeTheme();
  }

  @override
  void updateState({
    AppState state = AppState.idle,
  }) {
    stateData = SettingsData(
      appState: state,
    );
  }
}
