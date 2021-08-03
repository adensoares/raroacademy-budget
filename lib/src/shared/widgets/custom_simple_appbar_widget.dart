import 'package:budget/src/shared/constants/app_colors.dart';
import 'package:budget/src/shared/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class SimpleAppbar extends StatefulWidget implements PreferredSizeWidget {
   SimpleAppbar({ Key? key, this.hasFooter = true, this.height = 189 }) : super(key: key);

  final bool hasFooter;
  final double height;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  State<SimpleAppbar> createState() => _SimpleAppbarState();
}

class _SimpleAppbarState extends State<SimpleAppbar> {
  final String title = "";

 String dropdownValue = 'Agosto';

  

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: Container(
        decoration: BoxDecoration(
          gradient: AppColors.splashGradient
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16.0, right: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.menu)
                  ),
                  if(title != "Olá José")
                  Expanded(                    
                    child: Text("Olá, José", style: AppTextStyles.white24w400Roboto,)
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(
                      color: Colors.red
                    ),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['Agosto', 'Setembro', 'Outubro', 'Novembro']
                      .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      })
                      .toList(),
                  )                                 
                ],             
              ),
              if(widget.hasFooter)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Olá, José", style: AppTextStyles.white26w700Roboto,),
                ],
              ),
              if(widget.hasFooter)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
               children: [
                 TextButton(onPressed: (){}, child: Text("Entradas", style: AppTextStyles.white24w400Roboto,)),
                 TextButton(onPressed: (){}, child: Text("Entradas", style: AppTextStyles.white24w400Roboto,)),
                 TextButton(onPressed: (){}, child: Text("Entradas", style: AppTextStyles.white24w400Roboto,)),
               ],
              )
            ],
          ),
        ),
      ),
      preferredSize: widget.preferredSize,
    );
  }
}