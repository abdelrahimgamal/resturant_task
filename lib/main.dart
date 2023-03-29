import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_quiz/Core/Colors/app_colors.dart';
import 'package:resturant_quiz/Core/Service/local_notification_service.dart';
import 'package:resturant_quiz/Features/Home/presentation/pages/home_page.dart';

import 'Features/Base/presentation/widgets/base_page.dart';
import 'Features/Home/presentation/manager/menu_controller.dart';

@pragma('vm:entry-point')
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService().localNotificationConfiguration();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MenuController appController =
        Get.put(MenuController(), permanent: true);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        child =   GetMaterialApp(
          title: 'Meal Quiz',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
          primaryColor: AppColors.primary,
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              secondary: AppColors.secondary,
            ),
            inputDecorationTheme: const InputDecorationTheme(

              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primary,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
          home: const BasePage(),
        );
        return child;
      },
    );
  }
}

/// 1. home
/// 2. details
/// 3. cart
/// 4. pick your seat (confirm + local notification)
