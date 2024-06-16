import 'package:flutter/material.dart';
import 'package:wallet/model/transaction.dart';

class DataProvider extends ChangeNotifier {
  final List<Transaction> _transactions = [];
  List<Transaction> get transactions => _transactions;
  List<String> _categoriesCache = [];

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
}
