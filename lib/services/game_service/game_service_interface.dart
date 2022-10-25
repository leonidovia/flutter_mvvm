import 'package:flutter_mvvm/models/application/events/base.dart';
import 'package:flutter_mvvm/models/application/events/game/gift_received_event_args.dart';

import '../base/base_service.dart';

abstract class IGameService extends BaseService {
  Event<GiftReceivedEventArgs> get giftReceived;

  Future<int> getUserMoney(String userId);
  Future<int> play(String userId, int bid);
}

