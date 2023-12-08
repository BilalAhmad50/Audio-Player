import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_player/const/app_style.dart';

class SettingColumn extends StatelessWidget {
  final String title;
  final String subTitle;
  const SettingColumn({super.key, required this.title, this.subTitle = ""});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.h, bottom: 9.h, right: 40.w, left: 10.w),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppStyle.heading20Whitew400,
            ),
            Text(
              subTitle,
              style: AppStyle.heading16Whitew400,
            )
          ],
        ),
      ),
    );
  }
}
