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
import 'package:new_architecture/features/settings/settings_view_model.dart'
    as _i74;
import 'package:new_architecture/features/template/template_view_model.dart'
    as _i755;
import 'package:new_architecture/product/providers/app_provider.dart' as _i838;
import 'package:new_architecture/product/repositories/auth_repository.dart'
    as _i321;
import 'package:new_architecture/product/services/auth_service.dart' as _i1069;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i915.CounterViewModel>(() => _i915.CounterViewModel());
    gh.factory<_i755.TemplateViewModel>(() => _i755.TemplateViewModel());
    gh.lazySingleton<_i159.IApiClient>(() => _i159.ApiClient());
    gh.singleton<_i238.ViewModelFactory>(() => _i238.ViewModelFactoryImpl());
    gh.singleton<_i838.IAppProvider>(() => _i838.AppProvider());
    gh.lazySingleton<_i1069.IAuthService>(
        () => _i1069.AuthService(gh<_i159.IApiClient>()));
    gh.lazySingleton<_i321.IAuthRepository>(
        () => _i321.AuthRepository(gh<_i1069.IAuthService>()));
    gh.factory<_i74.SettingsViewModel>(
        () => _i74.SettingsViewModel(gh<_i838.IAppProvider>()));
    return this;
  }
}
