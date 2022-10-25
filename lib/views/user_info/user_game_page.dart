import 'package:flutter/material.dart';
import 'package:flutter_mvvm/models/application/events/game/gift_received_event_args.dart';

import '../../view_models/user_info/user_game_view_model_interface.dart';
import '../base/page_widget.dart';
import 'lastname_widget.dart';
import 'money_widget_vl.dart';
import 'name_widget.dart';
import 'play_button_vl.dart';

class UserGamePage extends PageWidget<IUserGameViewModel> {
  UserGamePage({Key? key}) : super(key: key);

  @override
  PageWidgetState createState() => _UserGamePageState();
}

class _UserGamePageState extends PageWidgetState<IUserGameViewModel> {
  @override
  void initState() {
    super.initState();
    vm.giftReceived.subscribe(_onGiftReceived);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NameWidget(vm.name),
            LastnameWidget(vm.lastName),
            MoneyWidgetVL(vm.moneyVN),
          ],
        ),
      ),
      floatingActionButton: PlayButtonVL(
        isLoadingVN: vm.isLoading,
        onPressed: vm.play,
      ),
    );
  }

  void _onGiftReceived(Object sender, GiftReceivedEventArgs e) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Gift!'),
          content: Text('\$${e.gift}'),
          actions: [
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: Text('OK'),
            ),
          ],
        ),
      );
}
