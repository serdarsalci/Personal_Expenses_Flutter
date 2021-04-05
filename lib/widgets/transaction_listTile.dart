import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import './transaction_item.dart';

class TransactionListTile extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionListTile(this.deleteTransaction, {this.transactions});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  'No transactions yet..',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : Container(
            // color: Colors.purple.shade100,
            child: ListView(
              children: transactions
                  .map((tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      deleteTransaction: deleteTransaction))
                  .toList(),
            ),
          );
  }
}
