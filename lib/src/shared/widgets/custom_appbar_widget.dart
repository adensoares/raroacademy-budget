import 'package:budget/src/shared/constants/app_colors.dart';
import 'package:budget/src/shared/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
   const CustomAppbar({ Key? key, this.hasFooter = false, this.height = 189, this.titleHeader = "Olá josé Antônio da Silva", this.title = "" }) : super(key: key);

  final bool hasFooter;
  final double height;
  final String titleHeader;
  final String title;

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
                  Expanded(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.menu, color: Colors.white,)
                      ),
                    ),
                  ),
                  if(widget.titleHeader != "")
                  Expanded(
                    child: Text(
                      widget.titleHeader,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.white24w400Roboto,
                      )
                    ),
                  //if(widget.hasFooter)
                  Expanded(
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [CustomDropdown(
                        months: ["Agosto", "Setembro"],
                      ),
                      ],
                    )
                  )                    
                ],             
              ),

              if(widget.title != "")
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(widget.title, style: AppTextStyles.white26w700Roboto,),
                ],
              ),
              if(widget.hasFooter)
              AppbarFooter()
            ],
          ),
        ),
      ),
      preferredSize: widget.preferredSize,
    );
  }
}

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({ Key? key, required this.months }) : super(key: key);

  final List<String> months;

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
     String dropdownValue = 'Agosto'; 
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 26,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: Colors.white, width: 1)
      ),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.expand_more, color: Colors.white,),
        iconSize: 24,
        //elevation: 16,
        style: const TextStyle(
          color: Colors.red
        ),
         underline: Container(
          height: 2,
          color: Colors.transparent,
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
      ),
    );                               
  }
}

class AppbarFooter extends StatelessWidget {
  const AppbarFooter({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
        TextButton(onPressed: (){}, child: Text("Entradas", style: AppTextStyles.white16w400Roboto,)),
        TextButton(onPressed: (){}, child: Text("Saidas", style: AppTextStyles.white16w400Roboto,)),
        TextButton(onPressed: (){}, child: Text("Total", style: AppTextStyles.white16w400Roboto,)),
      ],
    );
  }
}