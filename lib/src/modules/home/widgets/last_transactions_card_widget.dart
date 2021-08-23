import 'package:flutter/material.dart';

import 'package:budget/src/shared/constants/shared_constants.dart';
import 'package:budget/src/shared/models/transaction_model.dart';
import 'package:budget/src/shared/utils/extensions.dart';
import 'package:budget/src/shared/utils/transactions_icons.dart';
import 'package:intl/intl.dart';

class LastTransactionsCard extends StatelessWidget {
  LastTransactionsCard({
    Key? key,
    required this.transactions,
    required this.lastTransactionsBalance,
  }) : super(key: key);

  final List<TransactionModel> transactions;
  int lastTransactionsBalance = 0;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < transactions.length; i++) {
      if (transactions[i].transactionType == "out") {
        lastTransactionsBalance -= transactions[i].price;
      } else {
        lastTransactionsBalance += transactions[i].price;
      }
    }
    return Card(
        color: AppColors.grayCardBackgorund,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          ListTile(
            contentPadding:
                EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0, right: 8.0),
            trailing: IconButton(
              padding: EdgeInsets.only(top: 0.0),
              alignment: Alignment.topCenter,
              color: AppColors.purple,
              icon: Icon(Icons.navigate_next),
              onPressed: () {},
            ),
            title: Text(
              "Últimas transações",
              style: AppTextStyles.purple20w500Roboto,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lastTransactionsBalance.reais(),
                  style: AppTextStyles.black24w400Roboto,
                ),
                Text(
                  "No Momento",
                  style: AppTextStyles.lightGray14w500Roboto,
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                int transactionPrice = transactions[index].price;
                if (transactions[index].transactionType == "out") {
                  transactionPrice *= -1;
                }
                String complement = (transactions[index].transactionName != "")? " - ${transactions[index].transactionName}": "";
                return ListTile(
                  leading: getIconTransaction(
                      transactions[index].transactionCategory),
                  title: Text(transactions[index].transactionCategory + complement),
                  trailing: Text(transactionPrice.reais()),
                );
              },
            ),
          ),
        ]));
  }
}
