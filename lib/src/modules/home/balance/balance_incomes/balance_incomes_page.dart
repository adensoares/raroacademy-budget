import 'package:budget/src/modules/home/balance/balance_expenses/balance_expenses_page_controller.dart';
import 'package:budget/src/modules/home/balance/balance_incomes/balance_incomes_controler.dart';
import 'package:budget/src/modules/home/widgets/balances_card_page_widget.dart';
import 'package:budget/src/shared/constants/app_colors.dart';
import 'package:budget/src/shared/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class BalanceIncomes extends StatefulWidget {
  const BalanceIncomes({ Key? key }) : super(key: key);

  @override
  State<BalanceIncomes> createState() => _BalanceIncomesState();
}

class _BalanceIncomesState extends State<BalanceIncomes> {

BalanceIncomesController controller = BalanceIncomesController();
    

  @override
  void initState() {
    controller.getIncomeTransactions();
    //print(controller.incomesTransactions);
    super.initState();
  }
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
                itemCount: controller.incomesTransactions.length,
                itemBuilder: (_, index){
                  return ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        shape: BoxShape.circle
                      ),
                    ),
                    title: Text(controller.incomesTransactions[index].transactionName),
                  );
                }
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