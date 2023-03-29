part of 'widgets_imports.dart';

class HomeSliver extends StatelessWidget {
  const HomeSliver({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      floating: true,
      snap: true,
      automaticallyImplyLeading: false,
      expandedHeight: 310.h,

      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    final state = Get.find<MenuController>().sideMenuKey.currentState;
                    if (state!.isOpened) {
                      state.closeSideMenu();
                    } else {
                      state.openSideMenu();
                    }
                    // Get.find<MenuController>().scaffoldKey.currentState!
                    //     .openDrawer();
                  },
                  icon: Image.asset(
                    'assets/icons/drawer.png',
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
                SizedBox(width: 20.w),

                /// Deliver to
                Text(
                  'Delivery in :',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey,
                  ),
                ),
                SizedBox(width: 2.w),

                /// location
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        'Cairo, Egypt',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                ),
                const Spacer(),

                /// profile
                CircleAvatar(
                  radius: 20.r,
                  backgroundColor: AppColors.primary,
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: AppColors.primary,
                      radius: 18.r,
                      backgroundImage:
                          const AssetImage('assets/icons/profile.png'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),

            /// search TextField with outlined border with elevation
            const HomeSearch(),
            SizedBox(height: 17.h),

            /// categories
            HomeCategories(),
          ],
        ),
      ),
    );
  }
}
