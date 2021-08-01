import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget ({ Key? key, this.width, this.height, this.gradient, this.color, required this.borderRadius, required this.child, this.prefixIcon, this.posfixIcon, this.boxShadow, required this.onTap });

  final double? width;
  final double? height;
  final double borderRadius;
  final Gradient? gradient;
  final Color? color;
  final Widget child;
  final Widget? prefixIcon;
  final Widget? posfixIcon;
  final List<BoxShadow>? boxShadow;
  final void Function() onTap;
  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: gradient,
          color: color,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: boxShadow
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            prefixIcon ?? Container(),
            child,
            posfixIcon ??  Container(),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}