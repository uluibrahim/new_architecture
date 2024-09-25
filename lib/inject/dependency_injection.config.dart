// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:new_architecture/core/network/api_client.dart' as _i159;
import 'package:new_architecture/core/view_model/view_model_factory.dart'
    as _i238;
import 'package:new_architecture/features/counter/counter_view_model.dart'
    as _i915;
import 'package:new_architecture/features/login/login_view_model.dart' as _i556;
import 'package:new_architecture/features/settings/settings_view_model.dart'
    as _i74;
import 'package:new_architecture/features/template/template_view_model.dart'
    as _i755;
import 'package:new_architecture/inject/dependency_injection.dart' as _i764;
import 'package:new_architecture/product/providers/app_provider.dart' as _i838;
import 'package:new_architecture/product/repositories/auth_repository.dart'
    as _i321;
import 'package:new_architecture/product/services/auth_service.dart' as _i1069;
import 'package:new_architecture/product/services/shared_preferences_service.dart'
    as _i210;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i915.CounterViewModel>(() => _i915.CounterViewModel());
    gh.factory<_i755.TemplateViewModel>(() => _i755.TemplateViewModel());
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i210.ISharedPreferencesService>(
        () => _i210.SharedPreferencesService(gh<_i460.SharedPreferences>()));
    gh.singleton<_i238.ViewModelFactory>(() => _i238.ViewModelFactoryImpl());
    gh.singleton<_i838.IAppProvider>(
        () => _i838.AppProvider(gh<_i210.ISharedPreferencesService>()));
    gh.factory<_i74.SettingsViewModel>(
        () => _i74.SettingsViewModel(gh<_i838.IAppProvider>()));
    gh.lazySingleton<_i159.IApiClient>(
        () => _i159.ApiClient(gh<_i210.ISharedPreferencesService>()));
    gh.lazySingleton<_i1069.IAuthService>(
        () => _i1069.AuthService(gh<_i159.IApiClient>()));
    gh.lazySingleton<_i321.IAuthRepository>(
        () => _i321.AuthRepository(gh<_i1069.IAuthService>()));
    gh.factory<_i556.LoginViewModel>(() => _i556.LoginViewModel(
          gh<_i321.IAuthRepository>(),
          gh<_i210.ISharedPreferencesService>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i764.RegisterModule {}
