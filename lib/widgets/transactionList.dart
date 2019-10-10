import "package:flutter/material.dart";
import 'package:intl/intl.dart';

import "../models/transaction.dart";

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  "No expenses added yet...",
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 25),
                Container(
                    height: 200,
                    child: Image.asset(
                      "assets/images/waiting.png",
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 7,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                  child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: FittedBox(
                              child: Text("\$${transactions[index].amount}")),
                        ),
                      ),
                      title: Text(
                        "${transactions[index].title}",
                        style: Theme.of(context).textTheme.title,
                      ),
                      subtitle: Text(
                          DateFormat.yMMMd().format(transactions[index].date))),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
