import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_quiz/Core/Service/date_picker.dart';
import 'package:resturant_quiz/Core/Service/local_notification_service.dart';
import 'package:resturant_quiz/Features/Home/presentation/pages/home_page.dart';
import 'package:resturant_quiz/Shared/models/seat.dart';

import '../../../../../Core/Colors/app_colors.dart';
import '../../../Home/presentation/manager/menu_controller.dart';
import '../../../reserve/ui/widgets/scrollable_selection.dart';
import '../widgets/cart_item_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MenuController appController = Get.find<MenuController>();

    return Scaffold(
      appBar: AppBar(
          title:
          const Text('Order', style: TextStyle(color: AppColors.primary)),
          backgroundColor: Colors.white,
          leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.primary,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0),
      body: GetBuilder<MenuController>(
          init: appController,
          builder: (ctx) {
            return SingleChildScrollView(
              child: SafeArea(
                child: Container(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: appController.cartList.length,
                        itemBuilder: (context, index) {
                          return CartItemCard(
                            food: appController.cartList[index],
                            onMinus: () {
                              appController.removeItemFromCart(
                                  appController.cartList[index]);
                            },
                            onPlus: () {
                              appController
                                  .addItemToCart(appController.cartList[index]);
                            },
                          );
                        },
                      ),
                      Column(
                        children: [
                          Container(
                            color: AppColors.grey_opece,
                            child: Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: 20.w,
                                  top: 40.h,
                                  end: 20.w,
                                  bottom: 20.h),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Total receivable:",
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                          Text(
                                            "card payment",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "\$${appController.total}",
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  showCustomDialog(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: AppColors.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(12), // <-- Radius
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    'Reserve',
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  void showCustomDialog(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: (BuildContext context) {
          return GetBuilder<MenuController>(builder: (_) {
            return Padding(
              padding: MediaQuery
                  .of(context)
                  .viewInsets,
              child: FractionallySizedBox(
                heightFactor: _.canBookTable ? 0.75 : 0.4,
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListView(

                          children: [
                            SizedBox(height: 10.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    child: TextField(
                                      readOnly: true,
                                      controller: _.dateController,
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        labelText: 'Select Date',
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColors.primary,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                      onTap: () async {
                                        DatePicker.showIosDatePicker(
                                          context,
                                          onDateChanged: _.selectDate,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    child: TextField(
                                      readOnly: true,
                                      controller: _.timeController,
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        labelText: 'Select Time',
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColors.primary,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                      onTap: () async {
                                        DatePicker.showTimePicker(
                                          context,
                                          onTimeChanged: _.selectTime,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            TextField(
                              controller: _.numOfPeopleController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                labelText: 'Table Seats',
                                suffixText: "People",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (text) {},
                            ),
                            SizedBox(height: 20.h),
                            if (_.canBookTable)
                              ... [
                                SizedBox(height: 20.h),
                                ScrollableSelection(
                                  panelName: "Pick your Table",
                                  data: _.getSeats(),
                                  selectedId: _.selectedSeat,
                                  onSelected:_ .selectTableNumber,
                                ),
                                SizedBox(height: 20.h),
                              ],
                          ],
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_.canOrder) {
                              // Get.offAll(() => const HomePage());
                              LocalNotificationService.launchNotification(
                                message: NotificationMessage(
                                    data: {
                                      "title": "Your order is ready",
                                      "body":_.bookingDetails
                                    }),
                              );
                              _.clearAll();
                            } else {
                              Get.snackbar(
                                "Error",
                                "Please fill all the fields",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              'Confirm',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            );
          });
        });
  }
}
