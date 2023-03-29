part of 'widgets_imports.dart';

class HomeBody extends StatelessWidget {
  final Category category;
  final List<Food> foods;

  const HomeBody({
    Key? key,
    required this.category,
    required this.foods,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(15.h),
            child: Text(
              category.title,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          foods.isNotEmpty
              ? SizedBox(
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: foods.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 23.h);
                    },
                    itemBuilder: (context, index) {
                      final food = foods[index];
                      return CardFood(food: food);
                    },
                  ),
                )
              : Center(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/empty.gif",
                      height: 200,
                    ),
                    SizedBox(height: 0.h),
                    Text(
                      "No Food Available",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}
