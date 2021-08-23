// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_button_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GoogleController on _GoogleControllerBase, Store {
  final _$stateAtom = Atom(name: '_GoogleControllerBase.state');

  @override
  AppStatusGoogle get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(AppStatusGoogle value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$signInWithGoogleAsyncAction =
      AsyncAction('_GoogleControllerBase.signInWithGoogle');

  @override
  Future<void> signInWithGoogle() {
    return _$signInWithGoogleAsyncAction.run(() => super.signInWithGoogle());
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
