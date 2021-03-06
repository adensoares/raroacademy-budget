// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$stateAtom = Atom(name: '_HomeControllerBase.state');

  @override
  AppStatus get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(AppStatus value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$lastTransactionsBalanceAtom =
      Atom(name: '_HomeControllerBase.lastTransactionsBalance');

  @override
  int get lastTransactionsBalance {
    _$lastTransactionsBalanceAtom.reportRead();
    return super.lastTransactionsBalance;
  }

  @override
  set lastTransactionsBalance(int value) {
    _$lastTransactionsBalanceAtom
        .reportWrite(value, super.lastTransactionsBalance, () {
      super.lastTransactionsBalance = value;
    });
  }

  final _$generalBalanceAtom = Atom(name: '_HomeControllerBase.generalBalance');

  @override
  int get generalBalance {
    _$generalBalanceAtom.reportRead();
    return super.generalBalance;
  }

  @override
  set generalBalance(int value) {
    _$generalBalanceAtom.reportWrite(value, super.generalBalance, () {
      super.generalBalance = value;
    });
  }

  final _$monthlyBalanceAtom = Atom(name: '_HomeControllerBase.monthlyBalance');

  @override
  MonthlyBalanceModel get monthlyBalance {
    _$monthlyBalanceAtom.reportRead();
    return super.monthlyBalance;
  }

  @override
  set monthlyBalance(MonthlyBalanceModel value) {
    _$monthlyBalanceAtom.reportWrite(value, super.monthlyBalance, () {
      super.monthlyBalance = value;
    });
  }

  final _$getGeneralBalanceAsyncAction =
      AsyncAction('_HomeControllerBase.getGeneralBalance');

  @override
  Future<void> getGeneralBalance() {
    return _$getGeneralBalanceAsyncAction.run(() => super.getGeneralBalance());
  }

  final _$getLastTransactionsAsyncAction =
      AsyncAction('_HomeControllerBase.getLastTransactions');

  @override
  Future<void> getLastTransactions() {
    return _$getLastTransactionsAsyncAction
        .run(() => super.getLastTransactions());
  }

  final _$getMonthsAsyncAction = AsyncAction('_HomeControllerBase.getMonths');

  @override
  Future<void> getMonths() {
    return _$getMonthsAsyncAction.run(() => super.getMonths());
  }

  final _$getMonthlyBalanceAsyncAction =
      AsyncAction('_HomeControllerBase.getMonthlyBalance');

  @override
  Future<void> getMonthlyBalance() {
    return _$getMonthlyBalanceAsyncAction.run(() => super.getMonthlyBalance());
  }

  @override
  String toString() {
    return '''
state: ${state},
lastTransactionsBalance: ${lastTransactionsBalance},
generalBalance: ${generalBalance},
monthlyBalance: ${monthlyBalance}
    ''';
  }
}
