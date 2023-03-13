import 'package:flutter/material.dart';

main() => runApp(const ExpensesAPP());

class ExpensesAPP extends StatelessWidget {
  const ExpensesAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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
          // ignore: sized_box_for_whitespace
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
