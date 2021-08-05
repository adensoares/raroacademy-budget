import 'package:budget/src/shared/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class SimpleAppbar extends StatelessWidget implements PreferredSizeWidget{
  const SimpleAppbar({ Key? key, this.title = "", this.gradient, }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(100);

  final String title;
  final Gradient? gradient;
  //final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: preferredSize.height,
      decoration: BoxDecoration(
        gradient: gradient
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomLeft,
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
            child: Padding(
              padding: const EdgeInsets.only(bottom:8.0, top: 8.0),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center, 
                style: AppTextStyles.white24w400Roboto,
              ),
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