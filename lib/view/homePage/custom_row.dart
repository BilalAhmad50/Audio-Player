import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_player/const/app_style.dart';
import 'package:music_player/const/sizedbox_ext.dart';

class CustomRow extends StatelessWidget {
  final Widget startIcon;
  final String title;
  final Widget endIcon;
  const CustomRow(
      {super.key,
      required this.startIcon,
      required this.title,
      required this.endIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      child: Row(
        children: [
          startIcon,
          10.w.sbw,
          Text(
            title,
            style: AppStyle.heading20Whitew400,
          ),
          Spacer(),
          endIcon
        ],
      ),
    );
  }
}
