
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_quiz/Core/Colors/app_colors.dart';
import 'package:resturant_quiz/Features/Home/presentation/manager/menu_controller.dart';
import 'package:resturant_quiz/Features/cart/ui/screens/cart_screen.dart';

class UIHolder extends StatelessWidget {
  final Widget child;

   const UIHolder({Key? key, required this.child}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     final MenuController appController = Get.find<MenuController>();

     return Stack(
       children: [
        child,
         appController.cartList.isNotEmpty
             ? Align(
           alignment: Alignment.bottomCenter,
           child: GestureDetector(
             onTap: () {
               Get.to(() => const CartScreen());
             },
             child: Padding(
               padding: const EdgeInsets.all(10),
               child: Container(
                 height: 50.h,
                 padding: const EdgeInsets.all(4),
                 width: double.infinity,
                 decoration: BoxDecoration(
                   color: AppColors.primary,
                   borderRadius: BorderRadius.circular(10.r),
                 ),
                 child: Row(
                   mainAxisAlignment:
                   MainAxisAlignment.spaceEvenly,
                   children: [
                     Container(
                       padding: const EdgeInsets.all(4),
                       decoration: BoxDecoration(
                         color: AppColors.secondary,
                         borderRadius:
                         BorderRadius.circular(10.r),
                       ),
                       child: Padding(
                         padding:   EdgeInsets.symmetric(horizontal: 4.0.w),
                         child: Text(
                           "${appController.cartList.length}",
                           style: TextStyle(
                             fontSize: 16.sp,
                             fontWeight: FontWeight.w500,
                             color: AppColors.white,
                           ),
                         ),
                       ),
                     ),
                     Text(
                       "My Cart",
                       style: TextStyle(
                         fontSize: 16.sp,
                         fontWeight: FontWeight.w500,
                         color: AppColors.white,
                       ),
                     ),
                     Text(
                       "|",
                       style: TextStyle(
                         fontSize: 16.sp,
                         fontWeight: FontWeight.w500,
                         color: AppColors.white,
                       ),
                     ),
                     Text(
                       "\$${appController.total}",
                       style: TextStyle(
                         fontSize: 16.sp,
                         fontWeight: FontWeight.w500,
                         color: AppColors.white,
                       ),
                     ),
                   ],
                 ),
               ),
             ),
           ),
         )
             : const SizedBox.shrink()
       ],
     );
   }
 }
