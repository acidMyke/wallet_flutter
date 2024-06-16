import 'package:flutter/material.dart';
import 'package:nanoid/nanoid.dart';

class Transaction extends ChangeNotifier {
  /// This is the unique id of the transaction generated using nanoid
  final String id;

  /// This is the id of the parent transaction for refunds / payback transactions
  String? parentId;
  String category;
  String description = '';
  double amount;
  DateTime date;

  Transaction({
    required this.id,
    required this.category,
    required this.amount,
    required this.date,
    required this.description,
  });

  Transaction.create({
    required this.category,
    required this.amount,
    required this.description,
  })  : id = nanoid(),
        date = DateTime.now();
}
