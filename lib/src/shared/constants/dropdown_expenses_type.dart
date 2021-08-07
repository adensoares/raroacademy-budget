import 'package:budget/src/shared/constants/shared_constants.dart';
import 'package:budget/src/shared/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';

final List<DropDownExpensesType> list = [
  DropDownExpensesType(
    iconsWidget: IconsWidget(
      icontype: Icons.fastfood,
      containerColor: AppColors.yellow,
      iconcolor: Colors.white,
      size: 24.0,
    ),
    value: "Refeição",
  ),
  DropDownExpensesType(
    iconsWidget: IconsWidget(
      icontype: Icons.directions_bus_filled,
      containerColor: AppColors.green,
      iconcolor: Colors.white,
      size: 24.0,
    ),
    value: "Transporte",
  ),
  DropDownExpensesType(
    iconsWidget: IconsWidget(
      icontype: Icons.flight,
      containerColor: AppColors.pink,
      iconcolor: Colors.white,
      size: 24.0,
    ),
    value: "Viagem",
  ),
  DropDownExpensesType(
    iconsWidget: IconsWidget(
      icontype: Icons.school,
      containerColor: AppColors.cyan,
      iconcolor: Colors.white,
      size: 24.0,
    ),
    value: "Educação",
  ),
  DropDownExpensesType(
    iconsWidget: IconsWidget(
      icontype: Icons.attach_money,
      containerColor: AppColors.purple,
      iconcolor: Colors.white,
      size: 24.0,
    ),
    value: "Pagamentos",
  ),
  DropDownExpensesType(
    iconsWidget: IconsWidget(
      icontype: Icons.more_horiz,
      containerColor: AppColors.lilac,
      iconcolor: Colors.white,
      size: 24.0,
    ),
    value: "Outros",
  ),
];

class DropDownExpensesType {
  final IconsWidget iconsWidget;
  final String value;

  DropDownExpensesType({
    required this.iconsWidget,
    required this.value,
  });
}
