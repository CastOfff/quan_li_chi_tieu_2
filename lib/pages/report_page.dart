import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cash_flow_provider.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CashFlowProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Extend Page'),
      ),
    );
  }
}
