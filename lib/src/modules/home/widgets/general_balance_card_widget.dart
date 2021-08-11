import 'package:budget/src/shared/constants/shared_constants.dart';
import 'package:flutter/material.dart';

class GeneralBalanceCard extends StatelessWidget {
  const GeneralBalanceCard({
    Key? key, required this.balance,
  }) : super(key: key);

  final String balance;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.grayCardBackgorund,
      child: ListTile(
        contentPadding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0, right: 8.0),
        minVerticalPadding: 16.0,
        trailing: IconButton(
          padding: EdgeInsets.only(top: 0.0),
          alignment: Alignment.topCenter,
          color: AppColors.purple,
          icon: Icon(Icons.visibility),
          onPressed: (){},
        ),
        title: Text("Saldo Geral", style: AppTextStyles.purple20w500Roboto,),
        subtitle: Text(balance, style: AppTextStyles.black24w400Roboto,),
      )
    );
  }
}