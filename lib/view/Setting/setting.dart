import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_player/const/app_color.dart';
import 'package:music_player/view/Setting/setting_column.dart';
import 'package:music_player/view/audioPlayer/audio_player.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgr,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.backgr,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyAudioPlayer()),
                );
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 86.w),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF904848),
                          Color(0xD3904848),
                          Color(0xC6A65A5A),
                          Color(0x66A65A5A),
                          Color(0xB5A65959),
                          Color(0xCE924D4D)
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 19.h),
                          child: Image(image: AssetImage('assets/image 3.png')),
                        ),
                        SettingColumn(
                          title: 'General',
                        ),
                        Divider(
                          color: Colors.white,
                          thickness: 1,
                          indent: 0.0,
                          endIndent: 0.0,
                        ),
                        SettingColumn(
                          title: 'Lock screen playing',
                          subTitle: 'Show noe playing when lock screen',
                        ),
                        Divider(
                          color: Colors.white,
                          thickness: 1,
                          indent: 0.0,
                          endIndent: 0.0,
                        ),
                        SettingColumn(
                          title: 'Language ',
                          subTitle: 'system defult',
                        ),
                        Divider(
                          color: Colors.white,
                          thickness: 1,
                          indent: 0.0,
                          endIndent: 0.0,
                        ),
                        SettingColumn(
                          title: 'Privacy Policy',
                        ),
                        Divider(
                          color: Colors.white,
                          thickness: 1,
                          indent: 0.0,
                          endIndent: 0.0,
                        ),
                        SettingColumn(
                          title: 'Help',
                        ),
                        Divider(
                          color: Colors.white,
                          thickness: 1,
                          indent: 0.0,
                          endIndent: 0.0,
                        ),
                        SettingColumn(
                          title: 'version',
                          subTitle: '2.14.4.118',
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
