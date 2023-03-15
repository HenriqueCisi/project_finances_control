import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project_finances_control/models/transaction.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) addTransaction;

  const TransactionForm(this.addTransaction, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text.toString()) ?? 0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.addTransaction(title, value);
  }

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
            onSubmitted: (_) =>{
              _submitForm()
            },
            autofocus: true,
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Valor (R\$)'),
            controller: valueController,
            onSubmitted: (_) => {
              _submitForm()
            },
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            autofocus: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.purple)),
                  onPressed: () {
                    _submitForm();
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
