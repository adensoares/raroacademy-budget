import 'package:budget/src/shared/constants/app_colors.dart';
import 'package:budget/src/shared/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({Key? key, required this.dropdownItens, this.gradient, required this.initialValue})
      : super(key: key);

  final List<String> dropdownItens;
  final String initialValue;
  final Gradient? gradient;

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {

  late String currentValue;

  @override
  void initState() {
    currentValue = widget.initialValue; 
    super.initState();    
  }  
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        canvasColor: AppColors.purple
      ),
      child: Container(
        padding: EdgeInsets.only(left: 8),
        height: 30,
        decoration: BoxDecoration(
          gradient: widget.gradient,
          color: null,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: DropdownButton<String>(
          value: currentValue,
          icon: const Icon(
            Icons.expand_more,
            color: Colors.white,
          ),
          iconSize: 24,
          style: AppTextStyles.white14w500Roboto,
          underline: Container(
            height: 2,
            color: Colors.transparent,
          ),
          onChanged: (String? newValue) {
            setState(() {
              currentValue = newValue!;
            });
          },
          items: widget.dropdownItens.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: AppTextStyles.white14w500Roboto,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}