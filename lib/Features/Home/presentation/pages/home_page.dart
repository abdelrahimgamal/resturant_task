import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_quiz/Core/Colors/app_colors.dart';
import 'package:resturant_quiz/Features/Home/presentation/widgets/widgets_imports.dart';
import 'package:resturant_quiz/Features/Layout/presentation/pages/ui_holder.dart';
import '../manager/menu_controller.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MenuController appController = Get.find<MenuController>();
    return GetBuilder<MenuController>(
        init: appController,
        builder: (_) {
          return Scaffold(
            backgroundColor: AppColors.third,

            body: SafeArea(
              child: UIHolder(
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    const HomeSliver(),
                    HomeBody(
                      foods: appController.selectedList,
                      category: appController.categories.firstWhere(
                        (element) => element.selected == true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
