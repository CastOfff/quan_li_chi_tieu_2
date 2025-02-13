import 'package:flutter/material.dart';

import '../core/category_type.dart';

final List<Map<String, dynamic>> categoriesIncome = [
  {
    'name': CategoryType.salary,
    'icon': Icons.work,
    'color': Colors.blue,
  },
  {
    'name': CategoryType.allowance,
    'icon': Icons.attach_money,
    'color': Colors.green,
  },
  {
    'name': CategoryType.bonus,
    'icon': Icons.star,
    'color': Colors.amber,
  },
  {
    'name': CategoryType.investment,
    'icon': Icons.trending_up,
    'color': Colors.purple,
  },
  {
    'name': CategoryType.sideIncome,
    'icon': Icons.work_outline,
    'color': Colors.teal,
  },
  {
    'name': CategoryType.temporaryIncome,
    'icon': Icons.hourglass_empty,
    'color': Colors.orange,
  },
];