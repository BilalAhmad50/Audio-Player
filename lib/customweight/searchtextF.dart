import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_player/const/app_color.dart';
import 'package:music_player/const/app_style.dart';

class SearchTextField extends StatelessWidget {
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hintText;
  const SearchTextField(
      {super.key,
      this.suffixIcon,
      this.prefixIcon,
      this.hintText = "Search here"});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 11.h),
        fillColor: AppColors.whiteColor,
        filled: true,
        prefixIcon: IconButton(
            onPressed: null,
            icon: prefixIcon ??
                SvgPicture.asset(
                  "assets/Search.svg",
                  height: 14,
                  width: 14,
                )),
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: AppStyle.heading10BlackLightw400,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.transparent)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.transparent)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.transparent)),
      ),
    );
  }
}
