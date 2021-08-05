import 'package:budget/src/shared/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class SimpleAppbar extends StatelessWidget implements PreferredSizeWidget{
  const SimpleAppbar({ Key? key, this.title = "", this.gradient, required this.expanded, }) : super(key: key);

  final String title;
  final Gradient? gradient;
  final bool expanded;

  @override
  Size get preferredSize => Size.fromHeight(expanded ? 189 : 100);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left:16.0, right: 16.0, top: 36.0, bottom: 16.0),
      height: preferredSize.height,
      decoration: BoxDecoration(
        gradient: gradient
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.topLeft,
              child: Builder(
                builder: (context) {
                  return IconButton(
                    onPressed: ()=>Scaffold.of(context).openDrawer(),
                    icon: Icon(Icons.menu, color: Colors.white,),
                  );
                }
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center, 
              style: AppTextStyles.white24w400Roboto,
            )
          ),
          Expanded(
            flex: 1,
            child: Container()
          )
        ],
      ),
    );
  }
}