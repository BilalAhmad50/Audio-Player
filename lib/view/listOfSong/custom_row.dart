import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_player/const/app_style.dart';
import 'package:music_player/const/sizedbox_ext.dart';

class OnTapPressableRowListForSong extends StatelessWidget {
  final Widget startIcon;
  final String title;
  final String subTitle;
  final Widget endIcon;
  final VoidCallback onTap; 
  final VoidCallback onMoreVertTap; 

  OnTapPressableRowListForSong({
    required this.startIcon,
    required this.title,
    required this.subTitle,
    required this.endIcon,
    required this.onTap,
    required this.onMoreVertTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              startIcon,
              10.w.sbw,
              Expanded(
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
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onMoreVertTap,
                child: endIcon,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
