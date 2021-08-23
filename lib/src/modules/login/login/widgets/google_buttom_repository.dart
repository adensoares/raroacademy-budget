import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleButtomRepository {
  Future<bool?> googleUserExist() async {
    User? user = FirebaseAuth.instance.currentUser;
    final response = await FirebaseFirestore.instance
        .collection('/users')
        .where('phoneNumber', isEqualTo: user!.phoneNumber)
        .get();
    return response.docs.length <= 0;
  }

  Future<String?> signInWithGoogle() async {
    User? user;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        user = userCredential.user;

        // ignore: unused_element
        Future<bool?> gravarDados() async {
          final response = await FirebaseFirestore.instance
              .collection('/users')
              .where('email', isEqualTo: user!.email)
              .get();
          //      add({

          // });
          if (response.docs.length <= 0) {
            FirebaseFirestore.instance.collection('/users').add({
              'email': user.email,
              'name': user.displayName,
            });
          }
        }
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<void> signOutFromGoogle() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }
}
