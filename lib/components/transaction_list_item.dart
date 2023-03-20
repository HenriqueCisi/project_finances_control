import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({
    super.key,
    required this.tr,
    required this.delete,
  });

  final Transaction tr;
  final void Function(String p1) delete;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin:
          const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: FittedBox(
                  child: Text(
                "R\$ ${tr.value.toStringAsFixed(2)}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
            )),
        title: Text(
          tr.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(DateFormat('d MMM y').format(tr.date)),
        trailing: MediaQuery.of(context).size.width > 480
            ? TextButton(
                onPressed: () {
                  delete(tr.id);
                },
                child: Text('Excluir', style: Theme.of(context).textTheme.titleLarge))
            : IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  delete(tr.id);
                }),
        
      ),
    );
  }
}