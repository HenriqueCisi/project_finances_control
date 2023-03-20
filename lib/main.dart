import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_finances_control/components/chart.dart';
import 'package:project_finances_control/components/transaction_form.dart';

import 'components/transaction_list.dart';
import 'models/transaction.dart';

main() => runApp(ExpensesAPP());

class ExpensesAPP extends StatelessWidget {
  final ThemeData ourTheme = ThemeData();

  ExpensesAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const MyHomePage(),
        theme: ourTheme.copyWith(
            colorScheme: ourTheme.colorScheme
                .copyWith(primary: Colors.purple, secondary: Colors.amber),
            textTheme: ourTheme.textTheme.copyWith(
                titleLarge: const TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 20,
                    fontWeight: FontWeight.bold))));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];
  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(const Duration(days: 7)))
          ? true
          : false;
    }).toList();
  }

  _openTransactionModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addNewTransaction);
        });
  }

  void _addNewTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: date);

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) {
        return tr.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('Despesas Pessoais'),
      actions: [
        IconButton(
            onPressed: () => _openTransactionModal(context),
            icon: const Icon(Icons.add))
      ],
    );

    final availabeHeigth = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Exibir gráfico'),
                Switch(
                    value: _showChart,
                    onChanged: (value) {
                      setState(() {
                        _showChart = value;
                      });
                    }),
              ],
            ),
            
            if (_showChart)
              SizedBox(
                  height: availabeHeigth * 0.2,
                  child: Chart(_recentTransactions)),
            if (!_showChart)
              SizedBox(
                  height: availabeHeigth * 0.8,
                  child: TransactionList(_transactions, _deleteTransaction)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionModal(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
