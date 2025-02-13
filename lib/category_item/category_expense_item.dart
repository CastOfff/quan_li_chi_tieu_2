
import 'package:flutter/material.dart';

import '../core/category_type.dart';

final List<Map<String, dynamic>> categoriesExpense = [
  {'name': CategoryType.eating, 'icon': Icons.restaurant, 'color': Colors.orange},
  {'name': CategoryType.clothes, 'icon': Icons.shopping_bag, 'color': Colors.pink},
  {'name': CategoryType.spending, 'icon': Icons.attach_money, 'color': Colors.green},
  {'name': CategoryType.cosmetics, 'icon': Icons.face, 'color': Colors.purple},
  {'name': CategoryType.transactionFee, 'icon': Icons.credit_card, 'color': Colors.blue},
  {'name': CategoryType.healthcare, 'icon': Icons.medical_services, 'color': Colors.red},
  {'name': CategoryType.education, 'icon': Icons.school, 'color': Colors.teal},
  {'name': CategoryType.utilities, 'icon': Icons.electrical_services, 'color': Colors.indigo},
  {'name': CategoryType.transport, 'icon': Icons.directions_car, 'color': Colors.blueGrey},
  {'name': CategoryType.internet, 'icon': Icons.wifi, 'color': Colors.cyan},
  {'name': CategoryType.rent, 'icon': Icons.home, 'color': Colors.brown},
  {'name': CategoryType.entertainment, 'icon': Icons.movie, 'color': Colors.deepPurple},
];