import 'package:budget/src/shared/constants/shared_constants.dart';
import 'package:budget/src/shared/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';

class DailyBalanceCard extends StatelessWidget {
  const DailyBalanceCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.grayCardBackgorund,
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0, right: 8.0),
            trailing: CustomDropdown(
              initialValue: "Ago",
              dropdownItens: [
                "Jan",
                "Fev",
                "Mar",
                "Abr",
                "Mai",
                "Jun",
                "Jul",
                "Ago",
                "Set",
                "Out",
                "Nov",
                "Dez",
              ],
              gradient: AppColors.splashGradient,
            ),
            title: Text("Saldo Geral", style: AppTextStyles.purple20w500Roboto,),
            subtitle: Text("R\$ 3.000,00", style: AppTextStyles.black24w400Roboto,),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: FractionallySizedBox(
                        widthFactor: 0.8,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Saidas", style: AppTextStyles.lightGray14w500Roboto,),
                              Text("R\$ 5.000,00", style: AppTextStyles.lightGray14w400Roboto,),
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
                        widthFactor: 0.8,
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
                        widthFactor: 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Saidas", style: AppTextStyles.lightGray14w500Roboto,),
                            Text("R\$ 5.000,00", style: AppTextStyles.lightGray14w400Roboto,),
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
                        widthFactor: 0.8,
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
