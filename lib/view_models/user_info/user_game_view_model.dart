import 'package:flutter/src/foundation/change_notifier.dart';
import '../../models/domain/user/user_info.dart';
import '../../services/di/service_locator.dart';
import '../../services/game_service/game_service_interface.dart';
import 'package:injectable/injectable.dart';

import '../../services/UserInfoService/user_info_service_interface.dart';
import '../base/page_view_model.dart';
import 'user_game_view_model_interface.dart';

@LazySingleton(as: IUserGameViewModel)
class UserGameViewModel extends PageViewModel implements IUserGameViewModel {
  final _userInfoService = serviceLocator.get<IUserInfoService>();
  final _gameService = serviceLocator.get<IGameService>();

  late UserInfo _userInfo;

  @override
  String get name => _userInfo.name;

  @override
  String get lastName => _userInfo.lastname;

  @override
  final moneyVN = ValueNotifier<int>(0);

  @override
  final isLoading = ValueNotifier<bool>(false);

  UserGameViewModel() {
    _userInfo = _userInfoService.userInfo;
  }

  @override
  void init() async {
    super.init();

    isLoading.value = true;
    moneyVN.value = await _gameService.getUserMoney(_userInfo.id);
    isLoading.value = false;
  }

  @override
  Future<void> play() async {
    isLoading.value = true;
    moneyVN.value = await _gameService.play(_userInfo.id, 100);
    isLoading.value = false;
  }

  @disposeMethod
  @override
  void dispose() {
    moneyVN.dispose();
    isLoading.dispose();

    super.dispose();
  }
}
