import 'package:budget/src/shared/utils/transactions_icons.dart';
import 'package:flutter/material.dart';
import 'package:budget/src/shared/utils/extensions.dart';
import 'package:budget/src/shared/constants/shared_constants.dart';
import 'package:budget/src/shared/models/transaction_model.dart';

class BalancesCardPage extends StatelessWidget {

  const BalancesCardPage({
    Key? key,
    required this.transactions, 
    required this.balance,
    this.totalType = "" 
  }) : super(key: key);

  final String totalType;
  final List<TransactionModel> transactions;
  final int balance;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:16.0, right: 16.0, left: 16.0, bottom: 40.0),
      child: Card(
        color: AppColors.grayCardBackgorund,
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                //physics: NeverScrollableScrollPhysics(),
                //shrinkWrap: true,
                itemCount: transactions.length,
                
                itemBuilder: (context, index){
                  print(transactions[index].transactionType);
                  return ListTile(
                    leading: getIconTransaction(transactions[index].transactionCategory),
                    title: Text(
                      transactions[index].transactionCategory),
                    trailing: Text(transactions[index].price.reais()),
                  );
                },
              ),
            ),
            Divider(),
             ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total " + totalType, style: AppTextStyles.purple16w500Roboto,),
                  (balance >= 0 && totalType != "Saídas") ?
                  Text("+" +balance.reais(), style: AppTextStyles.green14w500Roboto)
                  :Text(balance.reais(), style: AppTextStyles.red14w500Roboto,),
              ],
              )
            ),
          ],
        )
      ),
    );
  }
}
