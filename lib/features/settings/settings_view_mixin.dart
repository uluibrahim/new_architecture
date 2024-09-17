part of 'settings_view.dart';

// Write here view's widgets and functions
mixin SettingsViewMixin
    on ScreenState<SettingsScreen, SettingsViewModel, SettingsData> {
  Widget get changeLanguageWidget {
    return Selector<AppModel, Locale?>(
      builder: (_, language, __) {
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: Languages.values
                .map((e) => _langugeButton(e, language?.languageCode))
                .toList());
      },
      selector: (_, appModel) => appModel.currentLanguage,
    );
  }

  PreferredSizeWidget get _appBar => AppBar(
        title: Text(context.locale.settings),
      );

  Widget get _body => Center(
        child: changeLanguageWidget,
      );

  Widget _langugeButton(Languages language, String? languageCode) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: languageCode == language.name
              ? const WidgetStatePropertyAll(Colors.blue)
              : const WidgetStatePropertyAll(Colors.grey)),
      onPressed: () {
        viewModel.changeLanguage(language);
      },
      child: Text(
        language.title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
