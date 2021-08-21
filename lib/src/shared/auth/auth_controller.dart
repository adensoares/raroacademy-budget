import 'package:budget/src/shared/auth/auth_repository.dart';
import 'package:budget/src/shared/models/user_model.dart';

class AuthController {
  AuthController({
    required this.authRepository,
  });

  AuthRepository authRepository;

  UserModel? user;

  Future<void> getUser() async {
    user = await authRepository.getUser();
  }
}
