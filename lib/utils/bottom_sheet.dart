import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_player/const/app_color.dart';
import 'package:music_player/const/app_style.dart';
import 'package:music_player/const/sizedbox_ext.dart';

class BottomSheetUtils {
  static void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return _buildBottomSheet(context);
      },
    );
  }

  static Widget _buildBottomSheet(BuildContext context) {
    return Material(
      color: AppColors.backgr,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 68.w, top: 10.h),
              child:
                  Text('AUD-20210810', style: AppStyle.heading20BlackLightw400),
            ),
            Padding(
              padding: EdgeInsets.only(left: 80.w),
              child: Text(
                '<unknown>',
                style: AppStyle.heading15BlackLightw400,
              ),
            ),
            Divider(
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: SvgPicture.asset('assets/b.t.1.svg'),
                    title: Text('Add to Playlist'),
                    onTap: () {
                      // Add your logic for playing music
                      Navigator.pop(context);
                    },
                  ),
                  32.h.sbh,
                  ListTile(
                    leading: SvgPicture.asset('assets/b.t.2.svg'),
                    title: Text('Delete'),
                    onTap: () {
                      // Add your logic for viewing photos
                      Navigator.pop(context);
                    },
                  ),
                  32.h.sbh,
                  ListTile(
                    leading: SvgPicture.asset('assets/b.t.3.svg'),
                    title: Text('Rename'),
                    onTap: () {
                      // Add your logic for watching videos
                      Navigator.pop(context);
                    },
                  ),
                  32.h.sbh,
                  ListTile(
                    leading: SvgPicture.asset('assets/b.t.4.svg'),
                    title: Text('Share'),
                    onTap: () {
                      // Add your logic for watching videos
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
