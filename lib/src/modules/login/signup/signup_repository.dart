import 'package:budget/src/shared/utils/month_to_string.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupRepository {
  final TextEditingController? email;
  final TextEditingController? password;
  final TextEditingController? cpf;
  final TextEditingController? name;
  final TextEditingController? number;
  final PageController? pageController;
  final GlobalKey<FormState>? signupkeypage1;
  SignupRepository({
    this.email,
    this.password,
    this.cpf,
    this.name,
    this.number,
    this.pageController,
    this.signupkeypage1,
  });

  Future<bool?> emailJacadastrado() async {
    try {
      final response = await FirebaseFirestore.instance
          .collection('/users')
          .where('email', isEqualTo: email!.text)
          .get();
      return response.docs.length > 0;
    } on FirebaseAuthException catch (e) {
      print('o tipo do erro foi de : ${e.code}');
      print(e.message);
    } catch (e) {
      print(e);
    }
  }

  Future<void> registrar() async {
    try {
      final response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email!.text, password: password!.text);
      final user = response.user;
      await FirebaseFirestore.instance.collection('/users').doc(user!.uid).set({
        'email': email!.text,
        'cpf': cpf!.text,
        'phoneNumber': number!.text,
        'name': name!.text,
      }).catchError((_) {
        print('aconteceu um erro');
      });
      await FirebaseFirestore.instance.collection('/months').doc(user.uid).set({
        "months": [monthToString(DateTime.now().month)]
      });
      await FirebaseFirestore.instance
          .collection('/balances')
          .doc(user.uid)
          .set({"total": 0});
      await FirebaseFirestore.instance.collection('/monthly_balances').add({
        "expenses": 0,
        "incomes": 0,
        "month": monthToString(DateTime.now().month),
        "total": 0,
        "userId": user.uid
      });
    } catch (e) {
      print(e);
    }
  }
}
