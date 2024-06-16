import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/model/bank.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Bank>(
        builder: (context, value, child) => Scaffold(
            appBar: AppBar(
              title: const Text("Add Transaction"),
              titleTextStyle: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 32,
                color: Colors.greenAccent,
              ),
            ),
            body: Column(children: [
              const TextField(
                  decoration: InputDecoration(
                labelText: 'Transaction Description',
              )),
              const TextField(
                  decoration: InputDecoration(
                labelText: 'Transaction Amount',
              )),
              DropdownMenu(dropdownMenuEntries: value.categories)
            ])));
  }
}
