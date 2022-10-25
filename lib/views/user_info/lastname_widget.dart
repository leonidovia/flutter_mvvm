import 'package:flutter/material.dart';

class LastnameWidget extends StatelessWidget {
  final String lastname;

  const LastnameWidget(this.lastname, {super.key});

  @override
  Widget build(BuildContext context) =>
      Text(lastname, style: Theme.of(context).textTheme.bodyText1);
}
