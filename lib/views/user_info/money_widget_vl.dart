import 'package:flutter/material.dart';

class MoneyWidgetVL extends StatelessWidget {
  final ValueNotifier<int> moneyVN;

  const MoneyWidgetVL(this.moneyVN, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: moneyVN,
      builder: (context, value, _) => Text(
        '\$$value',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
