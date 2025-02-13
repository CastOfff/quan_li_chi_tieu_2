import 'package:flutter/material.dart';
import 'package:quan_li_chi_tieu_2/category_item/category_expense_item.dart';

import '../../widget/category_selecter.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});
  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  final List<Map<String, dynamic>> categories = categoriesExpense;
  late String day;
  late String month;
  late String year;
  late String weekday;
  final DateTime date = DateTime.now();
  int selectedCategoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // DatePickerField(
          //   onDateSelected: (date) {
          //     setState(() {
          //       day = date.day.toString();
          //       month = date.month.toString();
          //       year = date.year.toString();
          //     });
          //   },
          // ),
          Expanded(
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
