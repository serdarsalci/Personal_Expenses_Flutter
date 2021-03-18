import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';
import 'package:personal_expenses/widgets/transaction_listTile.dart';

import './widgets/chart.dart';
import './models/transaction.dart';
import './alerts/deleteAlert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        // based on one color different shades
        primarySwatch: Colors.purple,
        // primaryColor: Colors.indigo,
        accentColor: Colors.amber,
        fontFamily: 'FiraCode',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontSize: 20,
              ),
              headline5: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.purple,
              ),
              // button: TextStyle(color: Colors.amber),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final titleController = TextEditingController();
  // final amountController = TextEditingController();

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

  // String idToDelete;

  List<Transaction> get _recentTransactions {
    return _userTransactions
        .where((tx) =>
            (tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)))))
        .toList();
  }

  void _addNewTransaction(String txTitle, double amount, DateTime date) {
    final newTx = Transaction(
      title: txTitle,
      amount: amount,
      date: date,
      id: DateTime.now().toString(),
    );

    setState(() {
      // _userTransactions.add(newTx);
      _userTransactions.insert(0, newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    //showCupertinoModalPopup(context: context, builder: builder)
    showModalBottomSheet(
        context: ctx,
        builder: (_bCtx) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _deleteTransaction(String id) {
    showAlertDialog(context, id, _deleteConfirmed);
  }

  void _deleteConfirmed(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Expenses',
          // style: TextStyle(fontFamily: 'OpenSans'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionListTile(
              _deleteTransaction,
              transactions: _userTransactions,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
