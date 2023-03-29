import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_quiz/Features/Base/presentation/widgets/base_drawer.dart';
import 'package:resturant_quiz/Features/Home/presentation/manager/menu_controller.dart';
import 'package:resturant_quiz/Features/Home/presentation/pages/home_page.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class BasePage extends StatelessWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MenuController>(builder: (logic) {
      return SideMenu(
        key: logic.sideMenuKey,
        menu:  const BaseDrawer(),
        type: SideMenuType.slideNRotate, // check above images
        child: Scaffold(
          key: logic.scaffoldKey,
          bottomNavigationBar: FlashyTabBar(
            selectedIndex: logic.selectedIndex,
            onItemSelected: logic.changeSelectedIndex,
            items: [
              FlashyTabBarItem(
                icon: const Icon(Icons.home),
                title: const Text('Home'),
              ),
              FlashyTabBarItem(
                icon: const Icon(Icons.favorite),
                title: const Text('Favorite'),
              ),
              FlashyTabBarItem(
                icon: const Icon(Icons.person),
                title: const Text('Profile'),
              ),
            ],
          ),
          drawer: const Drawer(),
          body: SafeArea(
            child: IndexedStack(
              index: logic.selectedIndex,
              children: const [
                HomePage(),
                  Center(
                  child: Text('Favorite'),
                ),
                  Center(
                  child: Text('Profile'),
                ),
              ],
            ),
          )
        ),
      );
    });
  }
}
