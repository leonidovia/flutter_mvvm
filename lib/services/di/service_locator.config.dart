// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../game_service/game_service.dart' as _i4;
import '../game_service/game_service_interface.dart' as _i3;
import '../user_info_service/user_info_service.dart' as _i6;
import '../user_info_service/user_info_service_interface.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initServiceLocator(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.IGameService>(() => _i4.GameService(),
      dispose: (i) => i.dispose());
  gh.lazySingleton<_i5.IUserInfoService>(() => _i6.UserInfoService());
  return get;
}
