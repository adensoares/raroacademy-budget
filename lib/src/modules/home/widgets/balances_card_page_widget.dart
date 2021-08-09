import 'package:budget/src/shared/constants/shared_constants.dart';
import 'package:flutter/material.dart';

class BalancesCardPage extends StatelessWidget {
  const BalancesCardPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:16.0, right: 16.0, left: 16.0, bottom: 40.0),
      child: Card(
        color: AppColors.grayCardBackgorund,
        child: Column(
          children: [
            Flexible(
              child: ListView(
                scrollDirection: Axis.vertical,
                //physics: NeverScrollableScrollPhysics(),
                //shrinkWrap: true,
                children: [
                  ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        shape: BoxShape.circle
                      ),
                    ),
                    title: Text("Teste1"),
                  ),
                  ListTile(
                    title: Text("Teste2"),
                  ),
                  ListTile(
                    title: Text("Teste3"),
                  ),
                  ListTile(
                    title: Text("Teste4"),
                  ),
                  ListTile(
                    title: Text("Teste5"),
                  ),
                  ListTile(
                    title: Text("Teste6"),
                  ),
                  ListTile(
                    title: Text("Teste7"),
                  ),
                  ListTile(
                    title: Text("Teste8"),
                  ),
                  ListTile(
                    title: Text("Teste8"),
                  ),
                   ListTile(
                    title: Text("Teste8"),
                  ),
                   ListTile(
                    title: Text("Teste8"),
                  ),
                   ListTile(
                    title: Text("Teste8"),
                  ),
                   ListTile(
                    title: Text("Teste8"),
                  ),
                  
                ],
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