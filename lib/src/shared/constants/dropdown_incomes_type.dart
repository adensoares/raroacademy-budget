import 'package:budget/src/shared/constants/pix_icons.dart';
import 'package:budget/src/shared/constants/shared_constants.dart';
import 'package:budget/src/shared/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';

final List<DropDownIncomesType> list = [
  DropDownIncomesType(
    iconsWidget: IconsWidget(
      icontype: Pix.pix,
      containerColor: AppColors.purple,
      iconcolor: Colors.white,
      size: 24.0,
    ),
    value: "Pix",
  ),
  DropDownIncomesType(
    iconsWidget: IconsWidget(
      icontype: Icons.attach_money,
      containerColor: AppColors.purple,
      iconcolor: Colors.white,
      size: 24.0,
    ),
    value: "Dinheiro",
  ),
  DropDownIncomesType(
    iconsWidget: IconsWidget(
      icontype: Icons.compare_arrows,
      containerColor: AppColors.purple,
      iconcolor: Colors.white,
      size: 24.0,
    ),
    value: "Doc",
  ),
  DropDownIncomesType(
    iconsWidget: IconsWidget(
      icontype: Icons.compare_arrows,
      containerColor: AppColors.purple,
      iconcolor: Colors.white,
      size: 24.0,
    ),
    value: "Ted",
  ),
  DropDownIncomesType(
    iconsWidget: IconsWidget(
      icontype: Icons.qr_code_scanner,
      containerColor: AppColors.purple,
      iconcolor: Colors.white,
      size: 24.0,
    ),
    value: "Boleto",
  ),
];

class DropDownIncomesType {
  final IconsWidget iconsWidget;
  final String value;

  DropDownIncomesType({
    required this.iconsWidget,
    required this.value,
  });
}
