import 'package:flutter/material.dart';
import './transaction_listTile.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  Function _deleteTransaction;

  UserTransactions(this._deleteTransaction);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Grocerys',
      amount: 16.53,
      date: DateTime.now(),
    )
  ];

  void _addNewTransaction(String txTitle, double amount, DateTime date) {
    final newTx = Transaction(
      title: txTitle,
      amount: amount,
      date: date,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        // TransactionListTile(_deleteTransaction,
        //     transactions: _userTransactions),
      ],
    );
  }
}
