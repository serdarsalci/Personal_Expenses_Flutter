import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

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
            ),
            TextField(
              // onChanged: (val) => amountInput = val,
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount'),
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
                onPressed: () {
                  addTx(titleController.text,
                      double.parse(amountController.text));
                  // print(titleInput);
                  // print(amountInput);
                  // print(amountController.text);
                  // print(titleController.text);
                },
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
