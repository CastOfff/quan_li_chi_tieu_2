import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/category_type.dart';

class CategoryItem extends StatefulWidget {
  final CategoryType category;
  final AssetImage categoryImage;
  final Color frameColor;
  final VoidCallback onTap;
  final double thickness;
  final Color backgroundColor;
  const CategoryItem(
      {super.key,
        required this.category,
        required this.categoryImage,
        required this.frameColor,
        required this.onTap,
        required this.thickness,
        required this.backgroundColor,
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
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.h),
          height: 72.w,
          width: 72.w,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            shape: BoxShape.rectangle,
            border: Border.all(
              color: widget.frameColor,
              width: widget.thickness, // Độ dày của khung
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                width: 32.w,
                height: 32.w,
                fit: BoxFit.cover,
                image: widget.categoryImage,),
              SizedBox(
                height: 4.h,
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