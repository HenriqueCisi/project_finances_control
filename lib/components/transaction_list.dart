import 'package:flutter/material.dart';
import 'package:project_finances_control/components/transaction_list_item.dart';
import 'package:project_finances_control/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) delete;
   const TransactionList(this.transactions, this.delete, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text('Nenhuma Transação Cadastrada',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final tr = transactions[index];
                return TransactionListItem(tr: tr, delete: delete);
              },
            ),
    );
  }
}
