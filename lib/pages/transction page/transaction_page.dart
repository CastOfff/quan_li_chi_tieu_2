import 'package:flutter/material.dart';
import 'income_page.dart';
import 'expense_page.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> with SingleTickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giao dịch'),
      ),
      body: Column(
        children: [
          TabBar(
            labelStyle: const TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.w600,
                fontSize: 20
            ),
            padding: const EdgeInsets.all(10.0),
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(width: 4.0, color: Colors.deepOrange), // Độ dày và màu sắc
              insets: EdgeInsets.symmetric(horizontal: 60.0),
              // Khoảng cách từ viền
            ),
            indicatorColor: Colors.deepOrange,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(
                text: 'Chi tiêu',
              ),
              Tab(
                text: 'Thu nhập',
              )
            ],
          ),
          Expanded(child: TabBarView(
            controller: tabController,
            children: const [
              ExpensePage(),
              IncomePage(),
            ],
          ),)
        ],
      ),
    );
  }
}
