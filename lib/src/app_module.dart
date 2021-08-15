import 'package:budget/src/modules/home/home_module.dart';
import 'package:budget/src/modules/login/login/login_module.dart';
import 'package:budget/src/modules/splash/splash_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [];

  // Provide all the routes for your module
  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: SplashModule()),
        ModuleRoute("/login", module: LoginModule()),
        ModuleRoute("/home", module: HomeModule()),
      ];
}
