import 'package:flutter/material.dart';

import '../../category_item/category_income_item.dart';
import '../../widget/category_selecter.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({super.key});

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  final List<Map<String, dynamic>> categories = categoriesIncome;
  int selectedCategoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: CategorySelecter(
              onCategorySelected: (index) {
                setState(() {
                  selectedCategoryIndex = index;
                });
              },
              selectedCategoryIndex: selectedCategoryIndex,
              categories: categories,
            ),
          ),

        ],
      ),
    );
  }
}
