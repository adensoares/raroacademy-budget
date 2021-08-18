import 'package:flutter/material.dart';

import 'package:budget/src/shared/constants/shared_constants.dart';
import 'package:budget/src/shared/models/transaction_model.dart';

class BalancesCardPage extends StatelessWidget {

  const BalancesCardPage({
    Key? key,
    required this.transactions,
  }) : super(key: key);

  final List<TransactionModel> transactions;
  
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
                  return ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        shape: BoxShape.circle
                      ),
                    ),
                    title: Text(transactions[index].transactionName),
                  );
                },
              ),
            ),
            Divider(),
             ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Saídas", style: AppTextStyles.purple16w500Roboto,),
                  Text("-R\$ 2.415,00", style: AppTextStyles.red14w500Roboto,),
              ],
              )
            ),
          ],
        )
      ),
    );
  }
}
