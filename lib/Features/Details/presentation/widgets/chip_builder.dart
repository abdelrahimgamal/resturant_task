import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_quiz/Core/Colors/app_colors.dart';
import 'package:resturant_quiz/Shared/models/title_model.dart';

class ChipBuilder extends StatelessWidget {
    const ChipBuilder({
    Key? key,
    required this.items,
    required this.onTap,

    this.selectedItems= const[],
  }) : super(key: key);

  final List<TitleModel> items;
  final Function(int) onTap;
  final List<int> selectedItems;

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
         return Wrap(
            spacing: 10.w,
            runSpacing: 10.h,
            children: List.generate(
              items.length,
                  (index) {
                return GestureDetector(
                  onTap: () {
                    onTap(index);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: selectedItems.contains(index)
                          ? AppColors.primary
                          : AppColors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: AppColors.primary.withOpacity(0.4),
                      ),
                    ),
                    child: Text(
                      items[index].title,
                      style: TextStyle(
                        color: selectedItems.contains(index)
                            ? AppColors.white
                            : AppColors.primary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
    );
  }
}
