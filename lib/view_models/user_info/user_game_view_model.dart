import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:flutter_mvvm/models/application/events/base.dart';
import 'package:injectable/injectable.dart';

import '../../models/application/events/game/gift_received_event_args.dart';
import '../../models/domain/user/user_info.dart';
import '../../services/user_info_service/user_info_service_interface.dart';
import '../../services/di/service_locator.dart';
import '../../services/game_service/game_service_interface.dart';
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
  final isLoadingVN = ValueNotifier<bool>(false);

  @override
  final giftReceived = ViewModelEvent<GiftReceivedEventArgs>();

  UserGameViewModel() {
    _userInfo = _userInfoService.userInfo;
    _gameService.giftReceived.subscribe(_onGiftReceived);
  }

  @override
  void init() async {
    super.init();

    isLoadingVN.value = true;
    moneyVN.value = await _gameService.getUserMoney(_userInfo.id);
    isLoadingVN.value = false;
  }

  @override
  Future<void> play() async {
    isLoadingVN.value = true;
    moneyVN.value = await _gameService.play(_userInfo.id, 100);
    isLoadingVN.value = false;
  }

  void _onGiftReceived(Object sender, GiftReceivedEventArgs e) {
    giftReceived.raise(this, e);
    moneyVN.value = e.money;
  }

  @disposeMethod
  @override
  void dispose() {
    moneyVN.dispose();
    isLoadingVN.dispose();
    giftReceived.dispose();

    _gameService.giftReceived.unsubscribe(_onGiftReceived);

    super.dispose();
  }
}
