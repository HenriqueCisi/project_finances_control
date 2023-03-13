import 'package:flutter/material.dart';
import 'package:project_finances_control/models/transaction.dart';

main() => runApp(const ExpensesAPP());

class ExpensesAPP extends StatelessWidget {
  const ExpensesAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  final _transactions = [
    Transaction(
        id: 't1',
        title: 'Novo Tênis de Corrida',
        value: 300.00,
        date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Conta de Luz',
        value: 55.00,
        date: DateTime.now()),
  ];

   MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const <Widget>[
           Card(
            color: Colors.blue,
            child: Text('Gráfico'),
          ),
           Card(
            child: Text('Lista de Transações'),
          )
        ]
      ),
    );
  }
}
