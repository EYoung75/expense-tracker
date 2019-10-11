import 'package:flutter/material.dart';

import "./widgets/newTransaction.dart";
import "./widgets/transactionList.dart";
import "./widgets/chart.dart";
import "./models/transaction.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: "Quicksand",
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(fontFamily: "OpenSans", fontSize: 20),
              button: TextStyle(color: Colors.white)),
        ),
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> _userTransactions = [];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
    String txTitle, double txAmount, DateTime _chosenDate) {
      final newTransaction = Transaction(
        title: txTitle,
        amount: txAmount,
        date: _chosenDate,
        id: DateTime.now().toString(),
      );

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _showTransactionModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  void _deleteTransaction(String deleteId) {
    setState(() {
      _userTransactions.removeWhere((tx) {
        return tx.id == deleteId;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showTransactionModal(context),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Chart(_recentTransactions),
          Expanded(
              child: TransactionList(_userTransactions, _deleteTransaction))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: FloatingActionButton(
            child: Icon(
              Icons.add,
              color: Colors.red,
            ),
            backgroundColor: Colors.white,
            onPressed: () => _showTransactionModal(context),
          ),
        ),
        color: Colors.red,
      ),
    );
  }
}
