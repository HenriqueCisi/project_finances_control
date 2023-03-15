import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
        id: 't1', title: 'Conta de Água', value: 50.00, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Conta de Luz', value: 55.00, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Prime', value: 14.90, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [TransactionList(_transactions), TransactionForm()],
    );
  }
}
