part of 'widgets_imports.dart';

class CardCategory extends StatelessWidget {
  const CardCategory({
    Key? key,
    required this.category, this.onPressed,
  }) : super(key: key);

  final Category category;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsetsDirectional.only(end: 5.w, top: 5.h),
            child: Container(
              height: 85.h,
              margin: EdgeInsets.only(left: 20.w),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: category.selected ? AppColors.primary : Colors.white,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    category.image,
                    width: 40.w,
                    height: 40.h,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    category.title,
                    style: TextStyle(
                      fontSize: category.selected ? 10.sp : 8.sp,
                      fontWeight: FontWeight.w500,
                      color: category.selected ? Colors.white : AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            width: 20.w,
            height: 20.h,
            decoration: BoxDecoration(
              color: category.selected
                  ? AppColors.secondary
                  : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                category.count.toString(),
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color:
                      category.selected ? Colors.white : Colors.transparent,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
