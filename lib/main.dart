import 'package:flutter/material.dart';

import "./transaction.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: "t1",
      title: "New Shoes",
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "coffee",
      amount: 2.99,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses Tracker"),
      ),
      body: Column(
        children: <Widget>[
          Card(
            color: Colors.blue,
            elevation: 10,
            child: Container(
              width: double.infinity,
              child: Text("Chart"),
            ),
          ),
          Card(
            child: Text("List of Trans."),
          )
        ],
      ),
    );
  }
}
