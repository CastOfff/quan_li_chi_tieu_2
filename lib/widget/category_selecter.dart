import 'package:flutter/material.dart';

import '../category_item/category_item.dart';

class CategorySelecter extends StatefulWidget {
  final Function(int) onCategorySelected;
  final int selectedCategoryIndex ;
  final List<Map<String, dynamic>> categories;

  const CategorySelecter({
    required this.onCategorySelected,
    required this.selectedCategoryIndex,
    required this.categories,
    super.key});

  @override
  State<CategorySelecter> createState() => _CategorySelecterState();
}

class _CategorySelecterState extends State<CategorySelecter> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
        ),
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          return CategoryItem(
            onTap: () => widget.onCategorySelected(index),
            thickness: widget.selectedCategoryIndex == index ? 3 : 1,
            frameColor: widget.selectedCategoryIndex == index ? Colors.deepOrange : Colors.grey,
            category: widget.categories[index]['name'],
            categoryIcon: Icon(
                widget.categories[index]['icon'],
              size: 29,
              color: widget.categories[index]['color'],
            ),
          );
        },
    );
  }
}
