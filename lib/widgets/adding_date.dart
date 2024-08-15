import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateAdd extends StatefulWidget {
  const DateAdd({
    super.key,
    required this.onTap,
  });
  final void Function(dynamic) onTap;

  @override
  State<DateAdd> createState() => _DateAddState();
}

class _DateAddState extends State<DateAdd> {
  DateTime? dateTime;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 11.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 17.h,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (dateTime != null) {
                      widget.onTap(dateTime!);
                    }
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Done',
                    style: TextStyle(
                      fontSize: 17.h,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 0,
            color: Colors.grey,
          ),
          Container(
            height: 200,
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            width: double.infinity,
            color: Colors.white,
            child: CupertinoDatePicker(
              backgroundColor: Colors.white,
              initialDateTime: dateTime,
              onDateTimeChanged: (DateTime newTime) {
                setState(() => dateTime = newTime);
              },
              mode: CupertinoDatePickerMode.date,
            ),
          ),
          SizedBox(height: 30.h)
        ],
      ),
    );
  }
}
