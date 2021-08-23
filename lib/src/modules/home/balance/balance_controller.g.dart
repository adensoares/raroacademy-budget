// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BalanceController on _BalanceControllerBase, Store {
  final _$visibleButtonAtom =
      Atom(name: '_BalanceControllerBase.visibleButton');

  @override
  bool get visibleButton {
    _$visibleButtonAtom.reportRead();
    return super.visibleButton;
  }

  @override
  set visibleButton(bool value) {
    _$visibleButtonAtom.reportWrite(value, super.visibleButton, () {
      super.visibleButton = value;
    });
  }

  final _$stateAtom = Atom(name: '_BalanceControllerBase.state');

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

  final _$transactionsAtom = Atom(name: '_BalanceControllerBase.transactions');

  @override
  List<TransactionModel> get transactions {
    _$transactionsAtom.reportRead();
    return super.transactions;
  }

  @override
  set transactions(List<TransactionModel> value) {
    _$transactionsAtom.reportWrite(value, super.transactions, () {
      super.transactions = value;
    });
  }

  final _$monthlyBalanceAtom =
      Atom(name: '_BalanceControllerBase.monthlyBalance');

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

  final _$getIncomesAsyncAction =
      AsyncAction('_BalanceControllerBase.getIncomes');

  @override
  Future<void> getIncomes() {
    return _$getIncomesAsyncAction.run(() => super.getIncomes());
  }

  final _$getExpensesAsyncAction =
      AsyncAction('_BalanceControllerBase.getExpenses');

  @override
  Future<void> getExpenses() {
    return _$getExpensesAsyncAction.run(() => super.getExpenses());
  }

  final _$getAllAsyncAction = AsyncAction('_BalanceControllerBase.getAll');

  @override
  Future<void> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  final _$getMonthsAsyncAction =
      AsyncAction('_BalanceControllerBase.getMonths');

  @override
  Future<void> getMonths() {
    return _$getMonthsAsyncAction.run(() => super.getMonths());
  }

  final _$getBalanceAsyncAction =
      AsyncAction('_BalanceControllerBase.getBalance');

  @override
  Future<void> getBalance() {
    return _$getBalanceAsyncAction.run(() => super.getBalance());
  }

  final _$_BalanceControllerBaseActionController =
      ActionController(name: '_BalanceControllerBase');

  @override
  void changeVisibilityButton(bool visibility) {
    final _$actionInfo = _$_BalanceControllerBaseActionController.startAction(
        name: '_BalanceControllerBase.changeVisibilityButton');
    try {
      return super.changeVisibilityButton(visibility);
    } finally {
      _$_BalanceControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
visibleButton: ${visibleButton},
state: ${state},
transactions: ${transactions},
monthlyBalance: ${monthlyBalance}
    ''';
  }
}
