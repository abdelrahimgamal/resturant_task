import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_quiz/Core/Colors/app_colors.dart';
import 'package:resturant_quiz/Shared/models/Food.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FoodDetailsImages extends StatefulWidget {
  const FoodDetailsImages({
    Key? key,
    required this.food,
  }) : super(key: key);

  final Food food;

  @override
  State<FoodDetailsImages> createState() => _FoodDetailsImagesState();
}
class _FoodDetailsImagesState extends State<FoodDetailsImages> {
  int _currentPage = 0;
  late PageController _pageController;



  @override
  void initState() {
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        _currentPage = (_pageController.page??0).toInt();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      List <String> images = widget.food.foodImages ?? [widget.food.image ?? ''];
      if (images.isNotEmpty && images[0].isNotEmpty) {
        {
          return Stack(
            children: [
              SizedBox(
                height: 200.h,
                width: double.infinity,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Image.network(
                      images[index],
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              if ( images.length > 1)
                Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: images.length,
                    effect: ExpandingDotsEffect(
                      dotColor: AppColors.primary,
                      activeDotColor: AppColors.secondary,
                      dotHeight: 8.h,
                      dotWidth: 8.w,
                      expansionFactor: 2,
                      spacing: 4.w,
                    ),
                  ),
                ),
              ),


            ],
          );
        }
      }
      return const SizedBox.shrink();
    });

  }
}


