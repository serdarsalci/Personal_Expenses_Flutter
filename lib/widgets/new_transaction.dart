import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    // return stops the function execution so addTx is not reached if returned !!!

    addTx(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              // onChanged: (val) {
              //   titleInput = val;
              // },
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
              // onEditingComplete: () {},
            ),
            TextField(
              // onChanged: (val) => amountInput = val,
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
              // onEditingComplete: () {},
              // onSubmitted: (_) {},
              onSubmitted: (_) => submitData(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.purple,
                  padding: EdgeInsets.all(10.0),
                  // backgroundColor: Colors.green[50],
                  backgroundColor: Colors.purple[100],
                  textStyle: TextStyle(),
                ),
                onPressed: submitData,
                child: Text(
                  'Add transaction.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
