import 'package:budget/src/modules/login/buttons/google/button_google_repository.dart';
import 'package:budget/src/modules/login/login_page.dart';
import 'package:budget/src/shared/constants/app_colors.dart';
import 'package:budget/src/shared/constants/app_text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
    required this.textHeader,
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
                    gradient: AppColors.headerButtonGradient,
                  ),
                  child: Text(
                    textHeader,
                    style: AppTextStyles.white26w700Roboto,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 25.0, top: 15.0),
                    child: Text(
                      "Perfil",
                      style: AppTextStyles.lightGray14w400Roboto,
                    )),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 25.0),
                  title: Text(
                    "Cadastro",
                    style: AppTextStyles.black16w400Roboto,
                  ),
                  onTap: () {},
                )
              ],
            ),
          ),
          Divider(),
          ListTile(
            title: const Text(
              'Sair',
              textAlign: TextAlign.center,
              style: AppTextStyles.purple16w400Roboto,
            ),
            onTap: () async {
              await GoogleSignIn().signOut();
              await FirebaseAuth.instance.signOut().then((value) =>
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => LoginPage()),
                      (route) => false));
            },
          ),
        ],
      ),
    );
  }
}
