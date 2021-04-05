import 'dart:math';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;

  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.purple,
      Colors.blue,
      Colors.green
    ];

    _bgColor = availableColors[Random().nextInt(4)];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.amber.shade100,
      elevation: 3,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(8, 2, 8, 8),
          child: FittedBox(
            child: Text(
              '\$${widget.transaction.amount.toStringAsFixed(2)}',
              style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 26, color: _bgColor),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 500
            ? TextButton.icon(
                onPressed: () {
                  widget.deleteTransaction(widget.transaction.id);
                },
                icon: Icon(Icons.delete, color: Theme.of(context).errorColor),
                label: Text(
                  'Delete',
                  style: TextStyle(color: Theme.of(context).errorColor),
                ))
            : IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                tooltip: 'Delete',
                onPressed: () {
                  widget.deleteTransaction(widget.transaction.id);
                },
              ),
      ),
    );
  }
}
