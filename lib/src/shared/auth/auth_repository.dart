import 'package:budget/src/shared/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<UserModel> getUser() async {
    final userResponse = await FirebaseFirestore.instance
        .collection('/users')
        .doc(_auth.currentUser!.uid)
        .get();
    if (userResponse.data() != null) {
      //Atribui os dados do userResponse ao user através o map do UserModel
      UserModel user = UserModel.fromMap(userResponse.data()!);
      user.userId = _auth.currentUser!.uid;
      user.phone = _auth.currentUser!.phoneNumber;
      print('user abaixo');
      print(user);
      return user;
    } else {
      return UserModel(
          userId: '', name: '', email: '', phone: '', cpf: '', password: '');
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
