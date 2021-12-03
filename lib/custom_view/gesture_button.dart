import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GestureBaseButton extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final Function()? onLongTap;

  const GestureBaseButton(
      {Key? key, this.onTap, this.onLongTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: key,
      child: child,
      onTap: onTap,
      onLongPressStart: (d) async {
        HapticFeedback.heavyImpact();
      },
      onLongPress: onLongTap,
    );
  }
}
