import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:budget/src/shared/models/user_model.dart';

class DrawerSignupRepository {
  final TextEditingController name;
  final TextEditingController cpf;
  final TextEditingController phoneNumber;
  final TextEditingController email;

  User? user = FirebaseAuth.instance.currentUser;
  DrawerSignupRepository({
    required this.name,
    required this.cpf,
    required this.phoneNumber,
    required this.email,
  });
  Future<bool?> changeFiles() async {
    await FirebaseFirestore.instance.collection('/users').doc(user!.uid).set({
      'name': name.text,
      'cpf': cpf.text,
      'email': email.text,
      'phoneNumber': phoneNumber.text,
    });
  }
}
