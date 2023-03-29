import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_quiz/Core/Colors/app_colors.dart';

class DatePicker {
  static Future<void> showIosDatePicker(BuildContext context,
      {required Function(DateTime) onDateChanged}) async {
    return showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height * 0.30,
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 200,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: onDateChanged,
                  ),
                ),
                CupertinoButton(
                    child: const Text('Done'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ],
            ),
          );
        });
  }

  static Future<void> showTimePicker(BuildContext context,
      {required Function(TimeOfDay) onTimeChanged}) async {
    return showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height * 0.30,
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 200.h,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.time,
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: (DateTime dateTime) {
                      onTimeChanged(TimeOfDay.fromDateTime(dateTime));
                    },
                  ),
                ),

              ],
            ),
          );
        });
  }
}
