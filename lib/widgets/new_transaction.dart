import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './adaptiveTextButton.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx) {
    print('Construction NewTransaction Widget');
  }

  @override
  _NewTransactionState createState() {
    print('createState NewTransaction Widget');
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String errorMessage = "";

  _NewTransactionState() {
    print('Constructor NewTransaction State');
  }

  @override
  void initState() {
    print('initState() in NewTransaction State called');
    super.initState();
  }

  @override
  void didUpdateWidget(covariant NewTransaction oldWidget) {
    print('didUpdateWidget');
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('dispose');
    // TODO: implement dispose
    super.dispose();
  }

  void _submitData() {
    if (_amountController.text.isEmpty) {
      setError('Enter Amount');
      return;
    }

    final enteredTitle = _titleController.text;

    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      setError('empty or invalid field');
      print('empty field');
      return;
    }

    // return stops the function execution so addTx is not reached if returned !!!

    // in state class with this syntax can acces the methods and properties inside of state class;

    //// widget gives access to the widged object this is important !!!!
    ///
    widget.addTx(enteredTitle, enteredAmount, _selectedDate);

    // Clear input fields now unneccessary because of the Navigator
    _titleController.text = '';

    Navigator.of(context).pop();
  }

  void setError(String str) {
    print('set error called');
    setState(() {
      errorMessage = str;
    });
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 90)),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
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
        elevation: 1,
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            // bottom: (MediaQuery.of(context).viewInsets.bottom + 20),
            bottom: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // CupertinoTextField(
              //   placeholder: "Title",
              // ),
              TextField(
                // onChanged: (val) {
                //   titleInput = val;
                // },
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                // onEditingComplete: () {},
              ),
              TextField(
                // onChanged: (val) => amountInput = val,
                controller: _amountController,
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(_selectedDate == null
                          ? 'No date choosen'
                          : DateFormat.yMMMd().format(_selectedDate)),
                    ),
                    AdaptiveTextButton('Choose Date', _presentDatePicker),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('$errorMessage'),
                    ElevatedButton(
                      style: TextButton.styleFrom(
                        primary: Theme.of(context).buttonColor,
                        padding: EdgeInsets.all(10.0),
                      ),
                      onPressed: _submitData,
                      child: Text(
                        'Add transaction.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
