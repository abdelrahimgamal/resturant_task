part of 'widgets_imports.dart';

class HomeCategories extends StatelessWidget {

  const HomeCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MenuController appController = Get.find<MenuController>();
    return GetBuilder<MenuController>(
        init: appController,
        builder: (context) {
          return Column(
            children: [
              /// categories title
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Offers',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xffE0201A),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 120.h,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: appController.categories.length,
                  itemBuilder: (context, index) {
                    final category = appController.categories[index];
                    return CardCategory(category: category,onPressed: (){
                      appController.setSelectedCategory(category);
                    },);
                  },
                ),
              ),
            ],
          );
        });
  }
}
