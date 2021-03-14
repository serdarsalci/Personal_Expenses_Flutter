import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
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
            TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.green.shade700),
                    foregroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () {
                  // print(titleInput);
                  // print(amountInput);
                  print(amountController.text);
                  print(titleController.text);
                },
                child: Text('Add transaction.'))
          ],
        ),
      ),
    );
  }
}
