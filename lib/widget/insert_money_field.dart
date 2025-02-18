import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:quan_li_chi_tieu_2/widget/number_format.dart';

class InsertMoneyField extends StatefulWidget {
  final TextEditingController moneyController;

  const InsertMoneyField({super.key, required this.moneyController});

  @override
  State<InsertMoneyField> createState() => _InsertMoneyFieldState();
}

class _InsertMoneyFieldState extends State<InsertMoneyField> {
  /// formatMoney
  void onMoneyChanged(String? money) {
    if (money == '') {
      widget.moneyController.text = '0';
      return;
    }
    int number = NumberFormatter().stringToInt(money ?? '0');
    widget.moneyController.text = NumberFormatter().formatMoney(number);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 6.0, left: 10.0, right: 10.0),
      padding: EdgeInsets.only(left: 8.0),
      child: Row(children: [
        Expanded(
          flex: 1,
          child: Text(
            'Số Tiền',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: TextFormField(
                controller: widget.moneyController,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        left: 12.0, right: 8.0, top: 4.0, bottom: 4.0),
                    filled: true,
                    fillColor: const Color(0xfff8e4dc),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xffe29c80)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none
                    ),
                    hintText: 'Nhập số tiền',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    )
                ),
                onChanged: (valuer) {
                  return onMoneyChanged(valuer);
                },
              ),
            )),
        const Text(
          'đ',
          style: TextStyle(
            fontSize: 20,
            decoration: TextDecoration.underline,
          ),
        )
      ]),
    );
  }
}
