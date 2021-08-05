import 'dart:ffi';

import 'package:budget/src/shared/constants/app_colors.dart';
import 'package:budget/src/shared/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'custom_dropdown_widget.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
   const CustomAppbar({ Key? key, this.hasFooter = true, this.height = 189, this.titleHeader = "", this.title = "", this.gradient, this.openDrawer, this.openInputs, this.openOutputs, this.openTotal }) : super(key: key);

  final bool hasFooter;
  final double height;
  final String titleHeader;
  final String title;
  final Gradient? gradient;
  final void Function()? openDrawer;
  final void Function()? openInputs;
  final void Function()? openOutputs;
  final void Function()? openTotal;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: Container(
        decoration: BoxDecoration(
          gradient: widget.gradient
        ),
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
                      child: IconButton(
                        onPressed: widget.openDrawer,
                        icon: Icon(Icons.menu, color: Colors.white,)
                      ),
                    ),
                  ),
                  if(widget.titleHeader != "" && widget.hasFooter == false)
                  Expanded(
                    child: Text(
                      widget.titleHeader,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.white24w400Roboto,
                      )
                    ),
                  Expanded(
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if(widget.titleHeader == "" && widget.title != "" && widget.hasFooter == true )
                        CustomDropdown(
                        months: ["Ago", "Set"],
                      ),
                      ],
                    )
                  )
                ],             
              ),
              if(widget.titleHeader == "" && widget.title != "" && widget.hasFooter == true)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(widget.title, style: AppTextStyles.white26w700Roboto,),
                ],
              ),
                Container(
                 height: 40,
                 child: Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,               
                  children: [
                    TextButton(
                      onPressed: widget.openInputs,
                      child: Text("Entradas",
                      style: AppTextStyles.white16w400Roboto,
                      )
                    ),
                    const VerticalDivider(
                      color: Colors.white,
                      thickness: 2,
                      indent: 10,
                      endIndent: 0,
                      width: 20,
                    ),
                    TextButton(
                      onPressed: widget.openOutputs,
                      child: Text("Saidas",
                      style: AppTextStyles.white16w400Roboto,
                      )
                    ),
                    const VerticalDivider(
                      color: Colors.white,
                      thickness: 2,
                      indent: 10,
                      endIndent: 0,
                      width: 20,
                    ),
                    TextButton(onPressed: widget.openTotal,
                    child: Text("Total",
                    style: AppTextStyles.white16w400Roboto,
                    )
                    )
                  ]
              ),
               )
            ],
          ),
        ),
      ),
      preferredSize: widget.preferredSize,
    );
  }
}