import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_quiz/Core/Colors/app_colors.dart';
import 'package:resturant_quiz/Features/Details/presentation/widgets/chip_builder.dart';
import 'package:resturant_quiz/Features/Details/presentation/widgets/food_details_images.dart';
import 'package:resturant_quiz/Features/Home/presentation/manager/menu_controller.dart';
import 'package:resturant_quiz/Features/Layout/presentation/pages/ui_holder.dart';
import 'package:resturant_quiz/Shared/models/Food.dart';

/// build a food details page with food details in a scrollable sheet page
class FoodDetailsPage extends StatelessWidget {
  final Food food;

  const FoodDetailsPage({
    super.key,
    required this.food,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MenuController>();
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<MenuController>(builder: (_) {
          return UIHolder(
            child: Stack(
              children: [
                /// food List of images
                FoodDetailsImages(food: food),

                /// food details
                DraggableScrollableSheet(
                  initialChildSize: 0.76,
                  minChildSize: 0.76,
                  maxChildSize: 0.9,
                  builder: (context, scrollController) {
                    return Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.only(top: 20.h),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 20.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.r),
                                topRight: Radius.circular(20.r),
                              ),
                            ),
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              controller: scrollController,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// food name
                                  Text(
                                    food.title,
                                    style: TextStyle(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  SizedBox(height: 6.h),

                                  /// food price
                                  Row(
                                    children: [
                                      Text(
                                        '\$${food.price}',
                                        style: TextStyle(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.secondary,
                                        ),
                                      ),
                                      const Spacer(),

                                      /// number of items (counter)
                                      Container(
                                        padding: EdgeInsets.all(5.w),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                controller
                                                    .removeItemFromCart(food);
                                              },
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    AppColors.secondary,
                                                radius: 10.r,
                                                child: Icon(
                                                  Icons.remove_circle,
                                                  color: Colors.white,
                                                  size: 20.sp,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 10.w,
                                              ),
                                              child: Text(
                                                '${_.getItemCount(food.id)}',
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                controller.addItemToCart(food);
                                              },
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    AppColors.primary,
                                                radius: 10.r,
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                  size: 20.sp,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  /// food description

                                  SizedBox(height: 20.h),
                                  Text(
                                    food.desc ?? '-',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.primary.withOpacity(0.8),
                                    ),
                                  ),
                                  SizedBox(height: 40.h),

                                  /// food ingredients

                                  Row(
                                    children: [
                                      Text(
                                        'Ingredients',
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                      SizedBox(width: 14.w),
                                      Image.asset(
                                        'assets/icons/checklist.png',
                                        width: 20.w,
                                        height: 20.h,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),

                                  /// food ingredients
                                  ChipBuilder(
                                    items: food.ingredients,
                                    selectedItems:  _.selectedIngredients,
                                    onTap: (item) {
                                      controller.chooseIngredients(item);
                                    },
                                  ),

                                  /// food nutrition
                                  const SizedBox(height: 20),
                                  Text(
                                    'Nutrition',
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                    ChipBuilder(
                                      items: food.nutritions,
                                      selectedItems: _.selectedNutrations,
                                      onTap: (item) {
                                        controller.chooseNutrations(item);
                                      },
                                    ),

                                  /// food calories
                                  const SizedBox(height: 20),
                                  Text(
                                    'Calories',
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  ChipBuilder(
                                    items: food.calories,
                                    selectedItems: _.selectedCalories,
                                    onTap: (item) {
                                      controller.chooseCalories(item);
                                    },
                                  ),

                                  /// food size
                                  const SizedBox(height: 20),
                                  Text(
                                    'Size',
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                   ChipBuilder(
                                    items: food.sizes,
                                    selectedItems: _.selectedSizes,
                                    onTap: (item) {
                                      controller.chooseSizes(item);
                                    },
                                   ),

                                  /// food weight
                                  const SizedBox(height: 20),
                                  Text(
                                    'Weight',
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    '${food.weight}g',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        /// like button
                        Positioned(
                          top: 0.h,
                          right: 40.w,
                          child: Container(
                            height: 50.h,
                            width: 50.w,
                            decoration: const BoxDecoration(
                              color: AppColors.pink,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
