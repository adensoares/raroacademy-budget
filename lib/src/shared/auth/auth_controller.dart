import 'package:budget/src/shared/auth/auth_repository.dart';
import 'package:budget/src/shared/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController {
  AuthController({
    required this.authRepository,
  });

  AuthRepository authRepository;

  UserCredential? currentUser;
  UserModel? user;

  Future<void> getUser() async {
    user = await authRepository.getUser();
  }

  Future<void> signInWithGoogle() async {
    currentUser = await authRepository.signInWithGoogle();
  }
}
