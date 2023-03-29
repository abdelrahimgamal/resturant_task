import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_quiz/Shared/models/seat.dart';

import '../../../../Core/Colors/app_colors.dart';

class ScrollableSelection extends StatelessWidget {
  final String panelName;

  final List<Seat> data;
  final int? selectedId;
  final Function(int)? onSelected;

  const ScrollableSelection({
    Key? key,
    required this.panelName,
    required this.data,
    this.selectedId,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment : MainAxisAlignment.start,
      children: [
        Text(
          panelName,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
        Builder(
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setState) {
                return Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  alignment: WrapAlignment.start,
                  children: data
                      .map(
                        (e) => Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 2.h,
                          ),
                          child: AbsorbPointer(
                            absorbing: e.reserved,
                            child: ElevatedButton(

                              onPressed: () {
                                if (e.reserved) return;
                                setState(() {
                                  for (var element in data) {
                                    element.selected = false;
                                  }
                                  e.selected = true;
                                });
                                onSelected?.call(e.id);
                              },
                              style: ElevatedButton.styleFrom(

                                primary: e.reserved
                                    ? AppColors.grey_opece
                                    : (e.selected
                                        ? AppColors.primary
                                        : Colors.white),
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(24),
                              ),
                              child: Text(
                                e.id.toString(),
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                  color: e.reserved
                                      ? Colors.white
                                      : (e.selected
                                          ? Colors.white
                                          : AppColors.primary),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
