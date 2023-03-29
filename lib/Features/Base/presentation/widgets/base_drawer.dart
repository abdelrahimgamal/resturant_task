import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_quiz/Core/Colors/app_colors.dart';

class BaseDrawer extends StatelessWidget {
  const BaseDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Food Review'),
            accountEmail: Text(
              'Test@gmail.com',
              style: TextStyle(
                color: AppColors.third,
                fontSize: 12.sp,
              ),
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundImage:
                 AssetImage('assets/icons/profile.png'),
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: Icon(
              Icons.home,
              color: AppColors.primary,
            ),
            title: const Text('Home'),
            onTap: () {

            },
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: AppColors.primary,
            ),
            title: const Text('Profile'),
            onTap: () {

            },
          ),
          ListTile(
            leading: Icon(
              Icons.favorite,
              color: AppColors.primary,
            ),
            title: const Text('Favorite'),
            onTap: () {

            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: AppColors.primary,
            ),
            title: const Text('Settings'),
            onTap: () {

            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: AppColors.pink,
            ),
            title: const Text('Logout' , style: TextStyle(color: AppColors.pink ),),
            onTap: () {

            },
          ),

        ],
      ),
    );
  }
}
