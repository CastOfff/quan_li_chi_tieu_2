import 'package:flutter/material.dart';

import '../../category_item/category_income_item.dart';
import '../../widget/calendar_filed.dart';
import '../../widget/category_selecter.dart';
import '../../widget/insert_money_field.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({super.key});

  @override
  State<IncomePage> createState() => _IncomePageState();
}
  @override
  initState() {

  }

class _IncomePageState extends State<IncomePage> {
  final List<Map<String, dynamic>> categories = categoriesIncome;
  int selectedCategoryIndex = 0;
  TextEditingController moneyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          CalendarFiled(
              onDateChanged: (selectDay) {
                print('${selectDay.year}, ${selectDay.month}, ${selectDay.day}');
              }
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
            height: 20,
            indent: 20,
            endIndent: 20,
          ),
          InsertMoneyField(moneyController: moneyController,),
          const Divider(
            thickness: 1,
            color: Colors.grey,
            height: 20,
            indent: 20,
            endIndent: 20,
          ),
          Center(
            heightFactor: 1.5,
            child: const Text(
              'Danh mục',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Flexible(
            flex: 7,
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
          Flexible(
            flex: 2,
            child: ElevatedButton(
              onPressed: (){
                initState();
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )
                ),
                backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 80, right: 80, top: 8, bottom: 8),
                child: Text('Xác nhận',style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
