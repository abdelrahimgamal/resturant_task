import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/Colors/app_colors.dart';
import '../../../../../Shared/models/Food.dart';

class CartItemCard extends StatelessWidget {
  final Food food;
  final VoidCallback? onPlus;
  final VoidCallback? onMinus;

  const CartItemCard({Key? key, required this.food, this.onPlus, this.onMinus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          /// image
          Container(
            width: 70.w,
            height: 70.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              image: DecorationImage(
                image: AssetImage(food.image ?? 'assets/images/empty.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 24.w),

          /// description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food.title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  '\$${food.price}',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 20.w),

          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
                side: BorderSide(width: 1, color: Colors.grey)),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: onPlus,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      width: 30.w,
                      height: 30.h,
                      child: Center(
                        child: Image.asset(
                          'assets/icons/ic_add.png',
                          width: 20.w,
                          height: 20.h,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '${food.count}',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  GestureDetector(
                    onTap: onMinus,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      width: 30.w,
                      height: 30.h,
                      child: Center(
                        child: Image.asset(
                          'assets/icons/ic_minus.png',
                          width: 20.w,
                          height: 20.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// cart
        ],
      ),
    );
  }
}
