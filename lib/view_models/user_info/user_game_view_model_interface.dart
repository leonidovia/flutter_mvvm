import 'package:flutter/material.dart';
import 'package:flutter_mvvm/models/application/events/base.dart';
import 'package:flutter_mvvm/view_models/base/page_view_model.dart';

import '../../models/application/events/game/gift_received_event_args.dart';

abstract class IUserGameViewModel extends PageViewModel {
  String get name;
  String get lastName;
  ValueNotifier<int> get moneyVN;
  ValueNotifier<bool> get isLoadingVN;

  ViewModelEvent<GiftReceivedEventArgs> get giftReceived;

  Future<void> play();
}