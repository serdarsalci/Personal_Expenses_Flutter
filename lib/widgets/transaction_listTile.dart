import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionListTile extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionListTile({this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions yet..',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 300,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text('\$${transactions[index].amount}'),
                        ),
                      ),
                      radius: 30,
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                  ),
                );
              },
              // Card(
              //   elevation: 3,
              //   child: Row(
              //     children: [
              //       Container(
              //         alignment: Alignment.centerRight,
              //         width: 120,
              //         padding: EdgeInsets.all(5),
              //         margin:
              //             EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //             color: Theme.of(context).primaryColor,
              //             width: 1,
              //           ),
              //         ),
              //         child: Text(
              //           '\$${transactions[index].amount.toStringAsFixed(2)}',
              //           style: Theme.of(context).textTheme.headline5,
              //         ),
              //       ),
              //       Column(
              //         children: [
              //           Text(
              //             transactions[index].title,
              //             style: Theme.of(context).textTheme.headline6,
              //           ),
              //           Text(
              //             DateFormat.yMMMMd()
              //                 .add_jm()
              //                 .format(transactions[index].date),
              //             // style: Theme.of(context).textTheme.subtitle2,
              //           )
              //         ],
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       )
              //     ],
              //   ),
              // );

              itemCount: transactions.length,
            ),
    );
  }
}
