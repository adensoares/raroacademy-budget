import 'package:budget/src/shared/constants/app_colors.dart';
import 'package:budget/src/shared/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key, required this.textHeader,
  }) : super(key: key);

  final String textHeader;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Flexible(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 25.0, top: 44.0),
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: AppColors.splashGradient,
                  ),
                  child: Text(
                    textHeader,
                    style: AppTextStyles.white26w700Roboto,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.0, top: 15.0),
                  child: Text("Perfil", style: AppTextStyles.lightGray14w400Roboto,)
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 25.0),
                  title: Text(
                    "Cadastro",
                    style: AppTextStyles.black16w400Roboto,
                  ),
                  onTap: (){},
                )
              ],
            ),
          ),
          Divider(),
          ListTile(
            title: const Text(
              'Sair',
              textAlign: TextAlign.center,
              style: AppTextStyles.purple16w400Roboto,),
            onTap: () {
              Navigator.pop(context);
            },
          ),  
        ],
      ),
    );
  }
}