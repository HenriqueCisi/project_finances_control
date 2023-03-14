import 'package:flutter/material.dart';
import 'package:project_finances_control/models/transaction.dart';
import 'package:intl/intl.dart';

main() => runApp(const ExpensesAPP());

class ExpensesAPP extends StatelessWidget {
  const ExpensesAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  final _transactions = [
    Transaction(
        id: 't1', title: 'Conta de Água', value: 50.00, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Conta de Luz', value: 55.00, date: DateTime.now()),
    Transaction(id: 't3', title: 'Prime', value: 14.90, date: DateTime.now()),
  ];

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
          children: <Widget>[
            const Card(
              color: Colors.blue,
              child: Text('Gráfico'),
            ),
            Column(
              children: _transactions.map((tr) {
                return Card(
                  child: Row(children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2)),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "R\$ ${tr.value.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple),
                      ),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(tr.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          Text(DateFormat('d MMM y').format(tr.date),
                              style:
                                  const TextStyle(fontWeight: FontWeight.w200)),
                        ]),
                  ]),
                );
              }).toList(),
            ),
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  const TextField(
                    decoration: InputDecoration(labelText: 'Título'),
                  ),
                  const TextField(
                    decoration: InputDecoration(labelText: 'Valor (R\$)'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.purple)),
                          onPressed: () {},
                          child: const Text(
                            'Nova Transação',
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  )
                ]),
              ),
            )
          ],
        ));
  }
}
