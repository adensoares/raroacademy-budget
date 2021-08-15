import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginRepository {
  final TextEditingController? email;
  final TextEditingController? password;

  LoginRepository({
    this.email,
    this.password,
  });

  Future<bool?> emailExiste() async {
    try {
      final response = await FirebaseFirestore.instance
          .collection('/users')
          .where('email', isEqualTo: email!.text)
          .get();
      return response.docs.length > 0;
    } on FirebaseAuthException catch (e) {
      print('erro com o login codigo : ${e.code}');
      throw e.message ?? 'nao foi possivel realizar o email';
    }
  }

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
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('usuario não encontrado!');
      } else if (e.code == 'wrong-password') {
        print('senha errada!');
      }
    }
  }

  Future<bool?> senhaExiste() async {
    try {
      final response = await FirebaseFirestore.instance
          .collection('/users')
          .where('senha', isEqualTo: password!.text)
          .get();
      return response.docs.length > 0;
    } on FirebaseAuthException catch (e) {
      print('erro com o login codigo : ${e.code}');
      print(e.message);
    }
  }
}
