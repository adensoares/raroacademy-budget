import 'package:budget/src/modules/home/home_module.dart';
import 'package:budget/src/modules/login/login_module.dart';
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

//! Navegação por rotas Nomeadas no Modular
//! Modular.to.pushNamed()

// Navega para a rota destino como por ex.:
// Modular.to.pushNamed("/create_account");

// Volta todas as rotas que estão na minha pilha, até a rota destino
// Modular.to.popUntil("/home")

// Da push na rota destino e remove todas as rotas anteriores
//! Modular.to.pushAndRemoveUntil()

// Remove a rota atual, voltando para a página anterior
//! Modular.to.pop()

// Remove a rota atual, e navega para a rota destino
// Modular.to.pushReplacementNamed("/login")

//! Modular.to.navigate()
//  Modular.to.navigate("..");
//  Modular.to.navigate("/home/profile/edit/adress/cep");
//  Modular.to.navigate("../../personal_data");