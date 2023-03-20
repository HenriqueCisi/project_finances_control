import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_finances_control/components/adaptative_button.dart';
import 'package:project_finances_control/components/adaptative_date_picker.dart';
import 'package:project_finances_control/components/adaptative_text_field.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) addTransaction;

  const TransactionForm(this.addTransaction, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime? _selectedDate;

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text.toString()) ?? 0;
    final date = _selectedDate!;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.addTransaction(title, value, date);
  }

  _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: 10 + MediaQuery.of(context).viewInsets.bottom),
          child: Column(children: [
            AdaptativeTextField('Título', _titleController, TextInputType.text,
                (_) => _submitForm),
            AdaptativeTextField(
                'Valor (R\$)',
                _valueController,
                const TextInputType.numberWithOptions(decimal: true),
                (_) => _submitForm),
            AdaptativeDatePicker(_selectedDate, (newDate) {
              setState(() {
                _selectedDate = newDate;
              });
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AdaptativeButton('Nova Transação', _submitForm),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
