part of 'widgets_imports.dart';

class CardFood extends StatelessWidget {
  final Food food;

  const CardFood({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MenuController appController = Get.find<MenuController>();
    return InkWell(
      onTap: () {
        Get.to(
          () => FoodDetailsPage(food: food),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            /// image + discount
            Stack(
              children: [
                Container(
                  width: 80.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                      image: AssetImage(food.image ?? 'assets/icons/empty.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (food.discount != 0)
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      alignment: Alignment.center,
                      width: 30.w,
                      height: 30.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.pink,
                      ),
                      child: Text(
                        '${food.discount}%',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(width: 24.w),

            /// description
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food.title ?? '',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    food.desc ?? '',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    '\$${food.price}',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.secondary,
                    ),
                  ),
                  if (food.discount != 0)
                    Row(
                      children: [
                        Text(
                          'Before : ',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey,
                          ),
                        ),
                        Text(
                          '\$${food.price}',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ),
            SizedBox(width: 20.w),

            /// cart
            GestureDetector(
              onTap: () {
                appController.addItemToCart(food);
              },
              child: Container(
                alignment: Alignment.bottomCenter,
                width: 30.w,
                height: 30.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/icons/cart.png',
                    width: 15.w,
                    height: 15.h,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
