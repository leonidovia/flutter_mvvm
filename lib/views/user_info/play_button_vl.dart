import 'package:flutter/material.dart';

class PlayButtonVL extends StatelessWidget {
  final ValueNotifier<bool> isLoadingVN;
  final VoidCallback onPressed;

  const PlayButtonVL({
    Key? key,
    required this.isLoadingVN,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: isLoadingVN,
        builder: (context, bool value, _) => FloatingActionButton(
          onPressed: value ? null : onPressed,
          child: value
              ? const CircularProgressIndicator(color: Colors.white)
              : const Icon(Icons.monetization_on),
        ),
      );
}
