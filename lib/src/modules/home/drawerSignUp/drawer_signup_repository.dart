import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerSignupRepository {
  final TextEditingController emailSub;
  DrawerSignupRepository({
    required this.emailSub,
    required this.nameSub,
    required this.phoneSub,
    required this.cpfSub,
  });
  final TextEditingController nameSub;
  final TextEditingController phoneSub;
  final TextEditingController cpfSub;

  CollectionReference users = FirebaseFirestore.instance.collection('/users');
  User? usercurrent = FirebaseAuth.instance.currentUser;

  Future<void> updateUser() {
    return users.doc(usercurrent!.uid).update({
      'email': emailSub.text,
      'cpf': cpfSub,
      'phone-number': phoneSub,
      'name': nameSub,
    });
  }
}
