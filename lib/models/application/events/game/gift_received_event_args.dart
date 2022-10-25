import 'package:flutter_mvvm/models/application/events/base.dart';

class GiftReceivedEventArgs extends EventArgs {
  final int gift;
  final int money;
  GiftReceivedEventArgs(this.gift, this.money);
}