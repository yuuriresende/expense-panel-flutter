// ignore_for_file: prefer_const_constructors
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:teste/components/transaction_form.dart';
import 'package:teste/components/transaction_list.dart';
import '../models/transaction.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData( 
        primarySwatch: Colors.purple,
      ),
      );
  }
}

class MyHomePage extends StatefulWidget { 
  
  MyHomePage({Key? key}) : super(key: key);  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
  
  ];

  _addTransaction(String title, double value, DateTime date){
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: title, value: value, date: date);
    setState(() {
      _transactions.add(newTransaction);

    });
    Navigator.of(context).pop();
  }
   _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) {
        return tr.id == id;
      });
    });
   }
 _openTransactionFormModal(BuildContext context){
    showModalBottomSheet(
      context: context, 
      builder: (_){
        return TransactionForm(_addTransaction);
        }
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: [
          IconButton( 
            icon: Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(        
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //crossAxisAlignment: CrossAxisAlignment.start,
          //flex-start
          children:[
          
          TransactionList(_transactions, _deleteTransaction),
          
        ],
        ),
      ),
      floatingActionButton: FloatingActionButton( 
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
