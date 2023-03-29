part of 'widgets_imports.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MenuController appController = Get.find<MenuController>();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
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
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'What do you want to eat today?',
          hintStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.grey,
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 20.w,
            minHeight: 24.h,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.all(8.w),
            child: Image.asset(
              'assets/icons/search.png',
              width: 24.w,
              height: 24.h,
            ),
          ),
        ),
        onChanged: (text){
          appController.searchByName(text.trim());
        },
      ),
    );
  }
}
