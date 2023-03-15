import 'package:flutter/material.dart';
import 'package:project_finances_control/components/transaction_form.dart';
import 'package:project_finances_control/components/transaction_user.dart';
import 'package:project_finances_control/models/transaction.dart';

import 'components/transaction_list.dart';

main() => runApp(const ExpensesAPP());

class ExpensesAPP extends StatelessWidget {
  const ExpensesAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Despesas Pessoais'),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const <Widget>[
             Card(
              color: Colors.blue,
              child: Text('Gráfico'),
            ),
             TransactionUser()
          ],
        ));
  }
}
