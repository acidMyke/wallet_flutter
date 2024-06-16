import 'package:flutter/material.dart';
import 'package:wallet/model/transaction.dart';

class Bank extends ChangeNotifier {
  static Bank? _instance;
  final List<Transaction> _transactions = [];
  List<Transaction> get transactions => _transactions;

  List<String> _categoriesCache = [];

  Bank._init();

  factory Bank() {
    return _instance ??= Bank._init();
  }

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    if (_categoriesCache.isNotEmpty) {
      _categoriesCache.add(transaction.category);
    }
    notifyListeners();
  }

  void removeTransaction(Transaction transaction) {
    _transactions.remove(transaction);
    if (_categoriesCache.isNotEmpty &&
        _transactions.any((t) => t.category == transaction.category)) {
      _categoriesCache.remove(transaction.category);
    }
    notifyListeners();
  }

  get categories {
    if (_categoriesCache.isEmpty) {
      _categoriesCache = _transactions.map((e) => e.category).toSet().toList();
    }
    return _categoriesCache;
  }

  double get totalSpent {
    return _transactions
        .where((element) => element.amount < 0)
        .map((e) => e.amount)
        .fold(0, (previousValue, element) => previousValue + element);
  }

  double get totalEarn {
    return _transactions
        .where((element) => element.amount > 0)
        .map((e) => e.amount)
        .fold(0, (previousValue, element) => previousValue + element);
  }
}
