import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_player/const/app_color.dart';
import 'package:music_player/const/sizedbox_ext.dart';
import 'package:music_player/view/Favoites/Favorites.dart';
import 'package:music_player/view/Setting/setting.dart';
import 'package:music_player/view/audioPlayer/audio_player.dart';
import 'package:music_player/view/homePage/home_page.dart';
import 'package:music_player/view/listOfSong/list_of_song.dart';

class MybottomNavig extends StatefulWidget {
  const MybottomNavig({Key? key}) : super(key: key);

  @override
  _MybottomNavigState createState() => _MybottomNavigState();
}

class _MybottomNavigState extends State<MybottomNavig> {
  int _currentIndex = 0;

  final List<Widget> screens = const [
    HomePage(),
    ListOfSong(),
    Favorites(),
    MyAudioPlayer(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned.fill(
            child: screens[_currentIndex],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 70.h, // Adjust the height as needed
              decoration: BoxDecoration(
                  color: AppColors.backgr // Set your own background color
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildNavItem('Home', 'assets/b.1.svg', 0),
                  buildNavItem('List', 'assets/b.2.svg', 1),
                  buildNavItem('Favorites', 'assets/heart.svg', 2),
                  buildNavItem('Player', 'assets/b.4.svg', 3),
                  buildNavItem('Settings', 'assets/b.5.svg', 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNavItem(String label, String iconPath, int index) {
    return IconButton(
      onPressed: () {
        setState(() {
          _currentIndex = index;
        });
      },
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(iconPath, width: 24.w, height: 24.h),
        1.h.sbh,
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp, 
              color: _currentIndex == index
                  ? Colors.white
                  : Colors.black.withOpacity(0.3),
            ),
          ),
        ],
      ),
    );
  }
}
