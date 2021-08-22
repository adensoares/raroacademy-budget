import 'package:budget/src/shared/constants/shared_constants.dart';
import 'package:flutter/material.dart';

class LastTransactionsCard extends StatelessWidget {
  const LastTransactionsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.grayCardBackgorund,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            contentPadding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0, right: 8.0),
            trailing: IconButton(
              padding: EdgeInsets.only(top: 0.0),
              alignment: Alignment.topCenter,
              color: AppColors.purple,
              icon: Icon(Icons.navigate_next),
              onPressed: (){},
            ),
            title: Text("Últimas Transações", style: AppTextStyles.purple20w500Roboto,),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("R\$ 398,30", style: AppTextStyles.black24w400Roboto,),
                Text("No Momento", style: AppTextStyles.lightGray14w500Roboto,),
              ],
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: ListView(
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                ListTile(
                  title: Text("Teste6"),
                ),
                ListTile(
                  title: Text("Teste7"),
                ),
                ListTile(
                  title: Text("Teste8"),
                ),
              ],
            ),
          )
        ]
      )
    );
  }
}