import 'package:flutter/material.dart';

import 'package:budget/src/modules/login/buttons/google/button_google_repository.dart';

class ButtonGoogleWidget extends StatelessWidget {
  ButtonGoogleWidget({
    Key? key,
    required this.onpressed,
  }) : super(key: key);
  final Future Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          side: BorderSide(color: Colors.grey, width: 1),
          elevation: 0.0,
          primary: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0))),
      onPressed: onpressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 7, bottom: 7, left: 31, right: 31),
            child: Image.asset(
              'assets/images/botoes/background_google_button.png',
            ),
          ),
        ],
      ),
    );
  }
}
