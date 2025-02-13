import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quan_li_chi_tieu_2/pages/home_page.dart';
import 'package:quan_li_chi_tieu_2/pages/transction%20page/transaction_page.dart';
import 'package:quan_li_chi_tieu_2/providers/cash_flow_provider.dart';

import 'core/theme.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CashFlowProvider()),
    ],
    child: MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme(),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
