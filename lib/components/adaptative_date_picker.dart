import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime? date;
  final Function(DateTime) onChangeDate;

  const AdaptativeDatePicker(this.date, this.onChangeDate, {super.key});

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      onChangeDate(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? SizedBox(
          height: 180,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: DateTime.now(),
            minimumDate: DateTime(2019),
            maximumDate: DateTime.now(),
            onDateTimeChanged: onChangeDate),
        )
        :  SizedBox(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                        date == null
                            ? 'Nenhuma data selecionada por padrão'
                            : DateFormat('dd/MM/y').format(date!),
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  TextButton(
                      onPressed: () {
                       _showDatePicker(context); 
                      },
                      child: const Text('Selecionar Data',
                          style: TextStyle(fontWeight: FontWeight.bold)))
                ],
              ),
            );
  }
}
