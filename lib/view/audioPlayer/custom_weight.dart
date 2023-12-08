import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_player/const/app_style.dart';
import 'package:music_player/const/sizedbox_ext.dart';

class AudioInfo extends StatelessWidget {
  const AudioInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.only(
                top: 50.h, bottom: 50.h, right: 75.w, left: 75.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                gradient: LinearGradient(
                  colors: [
                    Color(0x6BEF72EA),
                    Color(0x00EE91EA),
                    Color(0x6DEF77BF)
                  ],
                )),
            child: SvgPicture.asset('assets/Group.svg')),
        30.h.sbh,
        const Text('AUD-20210810', style: AppStyle.heading20Whitew400),
        10.h.sbh,
        const Text('<unknown>', style: AppStyle.heading16Whitew400),
      ],
    );
  }
}
