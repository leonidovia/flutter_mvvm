import 'dart:async';

import 'package:flutter_mvvm/models/application/events/base.dart';
import 'package:flutter_mvvm/models/application/events/game/gift_received_event_args.dart';
import 'package:injectable/injectable.dart';

import '../base/base_service.dart';
import 'game_service_interface.dart';

@LazySingleton(as: IGameService)
class GameService extends BaseService implements IGameService {
  var _money = 1000;

  Timer? giftTimer;

  @override
  final giftReceived = Event<GiftReceivedEventArgs>();

  @override
  Future<int> getUserMoney(String userId) async {
    await Future.delayed(Duration(seconds: 1));
    return _money;
  }

  @override
  Future<int> play(String userId, int bid) async {
    giftTimer?.cancel();

    await Future.delayed(Duration(seconds: 1));
    _money += bid * 2;

    giftTimer = Timer(Duration(seconds: 10), _giftTimerCallback);

    return _money;
  }

  void _giftTimerCallback() {
    final gift = 100;
    _money += gift;
    giftReceived.raise(this, GiftReceivedEventArgs(100, _money));
  }

  @disposeMethod
  @override
  void dispose() {
    giftTimer?.cancel();
    giftReceived.dispose();

    super.dispose();
  }
}
