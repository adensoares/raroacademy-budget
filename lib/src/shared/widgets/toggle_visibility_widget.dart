import 'package:budget/src/shared/constants/shared_constants.dart';
import 'package:flutter/material.dart';

class ToggleVisibility extends StatelessWidget {
  const ToggleVisibility({
    Key? key,
    this.visible = false,
    this.onPressed,
    this.color,
  }) : super(key: key);

  final bool visible;
  final VoidCallback? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        visible ? Icons.visibility_off : Icons.visibility,
        color: color,
      ),
      onPressed: onPressed,
    );
  }
}
