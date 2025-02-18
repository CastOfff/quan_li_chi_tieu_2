import 'package:flutter/material.dart';

import '../core/category_type.dart';

class CategoryItem extends StatefulWidget {
  final CategoryType category;
  final Icon categoryIcon;
  final Color frameColor;
  final VoidCallback onTap;
  final double thickness;

  const CategoryItem(
      {super.key,
        required this.category,
        required this.categoryIcon,
        required this.frameColor,
        required this.onTap,
        required this.thickness,
      });

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: EdgeInsets.all(4.0),
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            color: Color(0xfffdf4fd),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: widget.frameColor,
              width: widget.thickness, // Độ dày của khung
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.categoryIcon,
              SizedBox(
                height: 8,
              ),
              Text(
                widget.category.description,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ),
      ),
    );
  }
}