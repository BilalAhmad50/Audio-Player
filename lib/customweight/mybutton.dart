import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_player/const/app_color.dart';
import 'package:music_player/const/app_style.dart';

class MyButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String text;
  final Color? color;
  final TextStyle? style;
  final VoidCallback? onpress;
  const MyButton(
      {super.key,
      this.height,
      this.width,
      required this.text,
      this.color = AppColors.darkBlue,
      this.style,
      this.onpress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        width: width ?? 177.w,
        height: height ?? 37.h,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                20.r,
              ),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )),
        child: Center(
            child: Text(
          text,
          style: style ?? AppStyle.heading16Whitew700,
        )),
      ),
    );
  }
}
