import 'package:budget/src/shared/constants/shared_constants.dart';
import 'package:budget/src/shared/widgets/shared_widgets.dart';
import 'package:budget/src/shared/utils/extensions.dart';
import 'package:flutter/material.dart';

class DailyBalanceCard extends StatelessWidget {
  const DailyBalanceCard({
    Key? key, required this.balance, required this.incomes, required this.expenses, required this.dropdown,
  }) : super(key: key);

  final int balance;
  final int incomes;
  final int expenses;
  final CustomDropdown dropdown;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.grayCardBackgorund,
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0, right: 8.0),
            trailing: dropdown,
            title: Text("Dia a dia", style: AppTextStyles.purple20w500Roboto,),
            subtitle: Text(balance.reais(), style: AppTextStyles.black24w400Roboto,),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: FractionallySizedBox(
                        widthFactor: 1.0,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Entradas", style: AppTextStyles.lightGray14w500Roboto,),
                              Text(incomes.reais(), style: AppTextStyles.lightGray14w400Roboto,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: FractionallySizedBox(
                        alignment: FractionalOffset.centerLeft,
                        widthFactor: (incomes >= expenses)? 1.0 : (incomes/expenses).abs(),
                        child: Container(
                          height: 11,
                          decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [AppShadows.x0_y_2_b12_s0_white39]
                          )
                        )
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: FractionallySizedBox(
                        widthFactor: 1.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Saidas", style: AppTextStyles.lightGray14w500Roboto,),
                            Text(expenses.reais(), style: AppTextStyles.lightGray14w400Roboto,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: FractionallySizedBox(
                        alignment: FractionalOffset.centerLeft,
                        widthFactor: (expenses >= incomes)? 1.0 : (expenses/incomes).abs(),
                        child: Container(
                          height: 11,                                     
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(25)
                          )
                        )
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
