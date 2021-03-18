import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';

void showAlertDialog(BuildContext context, String id, deleteConfirmed) {
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  Widget continueButton = TextButton(
    child: Text(
      "Delete",
      style: TextStyle(color: Theme.of(context).errorColor),
    ),
    onPressed: () {
      Navigator.of(context).pop();
      deleteConfirmed(id);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Delete Expense?"),
    content: Text("Are you sure you want to delete expense?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
