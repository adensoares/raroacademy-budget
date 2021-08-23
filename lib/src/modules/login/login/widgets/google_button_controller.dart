import 'package:budget/src/modules/login/login/widgets/google_buttom_repository.dart';

import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
part 'google_button_controller.g.dart';

enum AppStatusGoogle { empy, loading, success, error }
class GoogleController = _GoogleControllerBase with _$GoogleController;

abstract class _GoogleControllerBase with Store {
  GoogleButtomRepository googleButtomRepository = GoogleButtomRepository();

  String? messageError;

  @observable
  AppStatusGoogle state = AppStatusGoogle.empy;

  @action
  Future<void> signInWithGoogle() async {
    try {
      state = AppStatusGoogle.loading;
      await googleButtomRepository.signInWithGoogle();

      state = AppStatusGoogle.success;
    } on PlatformException catch (e) {
      state = AppStatusGoogle.error;
      switch (e.message) {
        case 'sign_in_failed':
          return state.errorMessage();

        default:
      }
      messageError = e.message;
    } catch (e) {
      state = AppStatusGoogle.error;
      state.errorMessage();
    }
  }
}

extension Error on AppStatusGoogle {
  errorMessage() {
    if (this == AppStatusGoogle.error) {
      return 'Ops! Aconteceu algo errado! :c ';
    }
    return '';
  }
}
