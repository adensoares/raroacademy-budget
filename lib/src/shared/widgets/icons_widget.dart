import 'package:flutter/material.dart';

class IconsWidget extends StatelessWidget {
  IconsWidget({
    Key? key,
    required this.icontype,
    this.iconcolor,
    this.gradient,
    required this.size,
    required this.containerColor,
  }) : super(key: key);

  final IconData? icontype;
  final Color? iconcolor;
  final Gradient? gradient;
  final double? size;
  final Color? containerColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: gradient,
          color: containerColor,
        ),
        child: Center(
          child: Icon(
            icontype,
            color: iconcolor,
            size: size,
          ),
        ),
      ),
    );
  }
}
