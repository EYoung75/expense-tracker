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
                  margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(10),
                        child: Text(
                          "\$${transactions[index].amount.toStringAsFixed(2)}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.deepOrange),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.deepOrange,
                          width: 2,
                        )),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(transactions[index].title,
                              style: Theme.of(context).textTheme.title),
                          Text(
                            DateFormat.yMMMd().format(transactions[index].date),
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
