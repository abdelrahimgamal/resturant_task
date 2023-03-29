import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_quiz/Shared/models/seat.dart';

import '../../../../Core/Colors/app_colors.dart';

class ButtonSeat extends StatelessWidget {
  const ButtonSeat({
    Key? key,
    required this.seat,
    required this.seats,
  }) : super(key: key);

  final Seat seat;
  final List<Seat> seats;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (seat.reserved) {
          return;
        } else {
          for (var item in seats) {
            item.selected = false;
          }
          seat.selected = true;
        }
      },
      child: Text(
        seat.id.toString(),
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
          color: seat.reserved
              ? Colors.black
              : (seat.selected ? Colors.white : AppColors.primary),
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: seat.reserved
            ? Colors.grey
            : (seat.selected ? AppColors.primary : Colors.white),
        shape: CircleBorder(),
        padding: EdgeInsets.all(24),
      ),
    );
  }
}
