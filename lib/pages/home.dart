import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/model/bank.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Bank>(
        builder: (context, value, child) => Scaffold(
              appBar: AppBar(
                title: const Text("Wallet"),
                titleTextStyle: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 32,
                  color: Colors.greenAccent,
                ),
              ),
              body: Column(children: [
                Row(children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          "Spent",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '\$${value.totalSpent.toStringAsFixed(2)}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          "Earn",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '\$${value.totalEarn.toStringAsFixed(2)}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
                const SizedBox(height: 16),
                // Table of transactions
                Expanded(
                  child: ListView.builder(
                    itemCount: value.transactions.length,
                    itemBuilder: (context, index) {
                      final transaction = value.transactions[index];
                      return ListTile(
                        title: Text(transaction.category),
                        subtitle: Text(transaction.description),
                        trailing: Text(
                          transaction.amount.toStringAsFixed(2),
                          style: TextStyle(
                            color: transaction.amount < 0
                                ? Colors.red
                                : Colors.green,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ]),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/add-transaction');
                },
                child: const Icon(Icons.add),
              ),
            ));
  }
}
