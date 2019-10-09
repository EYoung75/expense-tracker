import "package:flutter/material.dart";
import 'package:intl/intl.dart';

import "../models/transaction.dart";

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((transaction) {
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(10),
                child: Text(
                  "\$${transaction.amount}",
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
                  Text(
                    transaction.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    DateFormat.yMMMd().format(transaction.date),
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}