import 'package:budget/src/shared/constants/app_colors.dart';
import 'package:budget/src/shared/constants/pix_icons.dart';
import 'package:budget/src/shared/widgets/icons_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget? getIconTransaction(String transactionType) {
  switch (transactionType) {
    case "Refeição":
      return IconsWidget(
        icontype: Icons.fastfood,
        containerColor: AppColors.yellow,
        iconcolor: Colors.white,
        size: 24.0,
      );
    case "Transporte":
      return IconsWidget(
        icontype: Icons.directions_bus_filled,
        containerColor: AppColors.green,
        iconcolor: Colors.white,
        size: 24.0,
      );
    case "Viagem":
      return IconsWidget(
        icontype: Icons.flight,
        containerColor: AppColors.pink,
        iconcolor: Colors.white,
        size: 24.0,
      );
    case "Educação":
      return IconsWidget(
        icontype: Icons.school,
        containerColor: AppColors.cyan,
        iconcolor: Colors.white,
        size: 24.0,
      );
    case "Pagamentos":
      return IconsWidget(
        icontype: Icons.attach_money,
        containerColor: AppColors.purple,
        iconcolor: Colors.white,
        size: 24.0,
      );
    case "Outros":
      return IconsWidget(
        icontype: Icons.more_horiz,
        containerColor: AppColors.lilac,
        iconcolor: Colors.white,
        size: 24.0,
      );
    case "Pix":
      return IconsWidget(
        icontype: Pix.pix,
        containerColor: AppColors.purple,
        iconcolor: Colors.white,
        size: 24.0,
      );
    case "Dinheiro":
      return IconsWidget(
        icontype: Icons.attach_money,
        containerColor: AppColors.purple,
        iconcolor: Colors.white,
        size: 24.0,
      );
    case "Doc":
      return IconsWidget(
        icontype: Icons.compare_arrows,
        containerColor: AppColors.purple,
        iconcolor: Colors.white,
        size: 24.0,
      );

    case "Ted":
      return IconsWidget(
        icontype: Icons.compare_arrows,
        containerColor: AppColors.purple,
        iconcolor: Colors.white,
        size: 24.0,
      );
    case "Boleto":
      return IconsWidget(
        icontype: Icons.qr_code_scanner,
        containerColor: AppColors.purple,
        iconcolor: Colors.white,
        size: 24.0,
      );
  }
}
