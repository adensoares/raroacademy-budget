import 'package:flutter/material.dart';


import 'package:budget/src/modules/login/login/widgets/google_button_controller.dart';


// ignore: must_be_immutable
class GoogleButtonWidget extends StatelessWidget {
  GoogleButtonWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          side: BorderSide(color: Colors.grey, width: 1),
          elevation: 0.0,
          primary: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0))),
      onPressed: onPressed,
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
