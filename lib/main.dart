import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/model/bank.dart';
import 'pages/home.dart';
import 'pages/add.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Bank(),
    child: const WalletApp(),
  ));
}

class WalletApp extends StatelessWidget {
  const WalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const HomePage(),
      routes: {
        '/': (context) => const HomePage(),
        '/add-transaction': (context) => const AddTransactionPage(),
      },
    );
  }
}
