import 'package:budget/src/modules/login/login/login_page.dart';
import 'package:budget/src/modules/login/login/password_page.dart';
import 'package:budget/src/modules/login/signup/signup_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => LoginPage()),
        ChildRoute('/signup', child: (_, args) => SignupPage()),
        ChildRoute('/password', child: (_, args) => PasswordPage()),
      ];
}
