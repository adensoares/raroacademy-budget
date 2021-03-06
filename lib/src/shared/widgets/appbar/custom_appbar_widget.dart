import 'package:budget/src/shared/constants/app_text_styles.dart';
import 'package:budget/src/shared/widgets/custom_dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../shared_widgets.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppbar(
      {Key? key,
      required this.text,
      this.gradient,
      required this.tabBar,
      required this.dropdown})
      : super(key: key);

  final String text;
  final Gradient? gradient;
  final Widget tabBar;
  final CustomDropdown dropdown;

  @override
  Size get preferredSize => Size.fromHeight(189);

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(gradient: widget.gradient),
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16.0, right: 16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Builder(builder: (context) {
                          return IconButton(
                            onPressed: () => Modular.to.pop(),
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          );
                        }),
                      ),
                    ),
                    Expanded(
                        child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [widget.dropdown],
                    ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.text,
                      style: AppTextStyles.white26w700Roboto,
                    )                   
                  ],
                ),
                Container(
                  child: widget.tabBar,
                )
              ]),
        ));
  }
}
