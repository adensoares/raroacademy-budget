import 'package:budget/src/shared/constants/shared_constants.dart';
import 'package:budget/src/shared/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';

class BalancePage extends StatefulWidget {
  const BalancePage({ Key? key }) : super(key: key);

  @override
  _BalancePageState createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppbar(
          title: "Olá, José da silva",
          gradient: AppColors.splashGradient,
          expanded: false,
        ),
        drawer: CustomDrawer(textHeader: "Olá, José",),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Card(
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
                  subtitle: Text("R\$ 3.000,00", style: AppTextStyles.black24w400Roboto,),
                )
              )
            ],
          ),
        ),
      
    );
  }
}