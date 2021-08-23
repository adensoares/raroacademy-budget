import 'package:budget/src/shared/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginRepository {
  final String? email;
  final TextEditingController? password;

  LoginRepository({
    this.email,
    this.password,
  });

  Future<bool?> emailExiste() async {
    try {
      final response = await FirebaseFirestore.instance
          .collection('/users')
          .where('email', isEqualTo: email!)
          .get();
      return response.docs.length > 0;
    } on FirebaseAuthException catch (e) {
      print('erro com o login codigo : ${e.code}');
      throw e.message ?? 'nao foi possivel realizar o email';
    }
  }

  Future logar() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!.text,
      );
      userCredential.user;

      final getUser = await FirebaseFirestore.instance
          .collection('/users')
          .doc(userCredential.user!.uid)
          .get();
      if (getUser.data() != null) {
        print(getUser.data());
        return true;
      } else {
        return false;
        // throw 'Usuário não encontrado!';
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
