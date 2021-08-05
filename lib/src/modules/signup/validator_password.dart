import 'package:flutter/cupertino.dart';

class ValidatorPassword {
  ValidatorPassword._();

  static FormFieldValidator compare(
      TextEditingController? passwordEC, String? message) {
    return (value) {
      final valuecompare = passwordEC?.text ?? '';
      if (value == null || value != null && value != valuecompare) {
        return message;
      }
      return null;
    };
  }
}
