import 'package:flutter/material.dart';

class NameWidget extends StatelessWidget {
  final String name;

  const NameWidget(this.name, {super.key});

  @override
  Widget build(BuildContext context) =>
      Text(name, style: Theme.of(context).textTheme.bodyText1);
}
