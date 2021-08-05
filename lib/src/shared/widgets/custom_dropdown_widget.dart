import 'package:budget/src/shared/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({ Key? key, required this.months, this.gradient }) : super(key: key);

  final List<String> months;
  final Gradient? gradient;

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
     String dropdownValue = 'Ago'; 
    return Container(
      padding: EdgeInsets.only(left: 8),
      height: 30,
      
      decoration: BoxDecoration(
        gradient: widget.gradient,
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.expand_more, color: Colors.white,),
        iconSize: 24,
        style: AppTextStyles.white14w500Roboto,
        underline: Container(
          height: 2,
          color: Colors.transparent,
        ), 
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items:   widget.months .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: AppTextStyles.black14w400Roboto,),
            );
          })
          .toList(),
      ),
    );                               
  }
}