import 'package:budget/src/shared/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
}
