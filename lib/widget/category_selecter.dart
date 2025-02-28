import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../category_item/category_item.dart';

class CategorySelecter extends StatefulWidget {
  final Function(int) onCategorySelected;
  final int selectedCategoryIndex;

  final List<Map<String, dynamic>> categories;

  const CategorySelecter(
      {required this.onCategorySelected,
      required this.selectedCategoryIndex,
      required this.categories,
      super.key});

  @override
  State<CategorySelecter> createState() => _CategorySelecterState();
}

class _CategorySelecterState extends State<CategorySelecter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 6.0,
          mainAxisSpacing: 6.0,
        ),
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          return CategoryItem(
            onTap: () => widget.onCategorySelected(index),
            thickness: widget.selectedCategoryIndex == index ? 3 : 1,
            frameColor: widget.selectedCategoryIndex == index
                ? Colors.deepOrange
                : Colors.grey,
            backgroundColor: widget.selectedCategoryIndex == index
                ? Color(0xffffeeea)
                : Color(0xfffdf4fd),
            category: widget.categories[index]['name'],
            categoryImage: widget.categories[index]['image'],
          );
        },
      ),
    );
  }
}
