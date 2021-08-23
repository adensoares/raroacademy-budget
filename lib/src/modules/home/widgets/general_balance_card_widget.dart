import 'package:budget/src/shared/constants/shared_constants.dart';
import 'package:budget/src/shared/utils/extensions.dart';
import 'package:budget/src/shared/widgets/toggle_visibility_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GeneralBalanceCard extends StatefulWidget {
  GeneralBalanceCard({
    Key? key,
    required this.balance,
    required this.hideBalance,
  }) : super(key: key);

  final int balance;
  bool hideBalance;

  @override
  _GeneralBalanceCardState createState() => _GeneralBalanceCardState();
}

class _GeneralBalanceCardState extends State<GeneralBalanceCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColors.grayCardBackgorund,
        child: ListTile(
          contentPadding:
              EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0, right: 8.0),
          minVerticalPadding: 16.0,
          trailing: IconButton(
            padding: EdgeInsets.only(top: 0.0),
            alignment: Alignment.topCenter,
            color: AppColors.purple,
            icon: ToggleVisibility(
              visible: widget.hideBalance,
              onPressed: () {
                setState(() {
                  widget.hideBalance = !widget.hideBalance;
                });
              },
            ),
            onPressed: () {},
          ),
          title: Text(
            "Saldo Geral",
            style: AppTextStyles.purple20w500Roboto,
          ),
          subtitle: Text(
            widget.hideBalance ? "" : widget.balance.reais(),
            style: AppTextStyles.black24w400Roboto,
          ),
        ));
  }
}
