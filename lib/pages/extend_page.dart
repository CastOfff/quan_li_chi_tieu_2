import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cash_flow_provider.dart';

class ExtendPage extends StatelessWidget {
  const ExtendPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CashFlowProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Extend Page'),
      ),
      body: ListView.builder(
        itemCount: provider.allTransactions.length,
          itemBuilder: (context, index) {
            var cashFlowData = provider.allTransactions[index];
            return ListTile(
                title: Text('${cashFlowData.amount} VND'),
            subtitle: Text(
                '${cashFlowData.category.description} - Ngày '
                    '${cashFlowData.date.day} '
                    '/${cashFlowData.date.month} '
                    '/${cashFlowData.date.year}'
            ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  provider.removeTransaction(cashFlowData);
                },
              )
            );
          },
      ),
    );
  }
}
