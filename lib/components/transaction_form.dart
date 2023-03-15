import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project_finances_control/models/transaction.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) addTransaction;

  TransactionForm(this.addTransaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Título'),
            controller: titleController,
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Valor (R\$)'),
            controller: valueController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.purple)),
                  onPressed: () {
                    final title = titleController.text;
                    final value = double.tryParse(valueController.text.toString()) ?? 0;

                    addTransaction(title, value);
                  },
                  child: const Text(
                    'Nova Transação',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          )
        ]),
      ),
    );
  }
}
