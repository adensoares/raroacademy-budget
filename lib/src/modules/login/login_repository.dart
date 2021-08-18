import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginRepository {
  final TextEditingController? email;
  final TextEditingController? password;

  LoginRepository({
    this.email,
    this.password,
  });

  Future<void> logar() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!.text,
        password: password!.text,
      );
      userCredential.user;
      FirebaseAuth.instance.authStateChanges().listen((event) {
        if (event == null) {
          print('usuario está deslogado!');
        } else
          print('usuario está logado');
      });
      await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<bool?> emailExiste() async {
    try {
      final response = await FirebaseFirestore.instance
          .collection('/users')
          .where('email', isEqualTo: email!.text)
          .get();
      return response.docs.length > 0;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<bool?> senhaExiste() async {
    try {
      final responsePassword = await FirebaseFirestore.instance
          .collection('/users')
          .where('senha', isEqualTo: password!.text)
          .get();
      return responsePassword.docs.length > 0;
    } catch (e) {
      print(e.toString());
    }
  }
}
