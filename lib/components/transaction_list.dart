import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList(this.transactions, this.onDelete);
  final void Function(String) onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty ? Column(children: [
        Text( 
          'Nenhuma Transacao cadastrada',          
        )
      ],) : ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index){
          final tr = transactions[index];
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5
            ),
            child: ListTile(  
              leading: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration( 
                    border: Border.all(
                      color: Colors.purple,
                      width: 1
                    )
                  ),
                  child: Text('R\$ ${tr.value.toStringAsFixed(2)}')),
              ),
              title: Text(  
                tr.title
              ),
              subtitle: Text(  
                DateFormat('d MMM y').format(tr.date),
              ), 
              trailing: IconButton( 
                icon: Icon(Icons.delete),
                onPressed: () => onDelete(tr.id),
              ),
            ),
          );
        },
       
      ),
    );
  }
}