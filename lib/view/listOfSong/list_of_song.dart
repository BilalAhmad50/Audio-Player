import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_player/const/app_color.dart';
import 'package:music_player/const/app_style.dart';
import 'package:music_player/const/sizedbox_ext.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:music_player/utils/pop_up_menu.dart';
import 'package:music_player/view/homePage/home_page.dart';
import 'package:music_player/view/listOfSong/custom_row.dart';
import 'package:music_player/utils/bottom_sheet.dart';

class ListOfSong extends StatefulWidget {
  const ListOfSong({Key? key}) : super(key: key);

  @override
  State<ListOfSong> createState() => _ListOfSongState();
}

class _ListOfSongState extends State<ListOfSong> {
  bool isSearchBarVisible = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgr,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 27, right: 17, top: 18),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                           Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()),
                          );
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSearchBarVisible = !isSearchBarVisible;
                          });
                        },
                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 500),
                          child: isSearchBarVisible
                              ? Container()
                              : SvgPicture.asset(
                                  'assets/clarity_search-line.svg',
                                  key: ValueKey('searchIcon'),
                                ),
                        ),
                      ),
                      26.w.sbw,
                      GestureDetector(
                        onTap: () {
                          showPopupMenu(context);
                        },
                        child: Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 16, right: 26),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/shift.svg'),
                      21.w.sbw,
                      Text(
                        'Shuffle All (70)',
                        style: AppStyle.heading20Whitew400,
                      ),
                    ],
                  ),
                ),
                16.h.sbh,
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        OnTapPressableRowListForSong(
                          startIcon: SvgPicture.asset('assets/music.svg'),
                          title: 'AUD-20210810',
                          subTitle: '<unknown>',
                          endIcon: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                          onTap: () {
                          },
                          onMoreVertTap: () {
                            BottomSheetUtils.showBottomSheet(context);
                          },
                        ),
                        Divider(
                          color: Colors.white,
                          thickness: 1,
                          indent: 0.0,
                          endIndent: 0.0,
                        ),
                        OnTapPressableRowListForSong(
                          startIcon: SvgPicture.asset('assets/music.svg'),
                          title: 'AUD-20210810',
                          subTitle: '<unknown>',
                          endIcon: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                          onTap: () {
                          },
                          onMoreVertTap: () {
                            BottomSheetUtils.showBottomSheet(context);
                          },
                        ),
                        Divider(
                          color: Colors.white,
                          thickness: 1,
                          indent: 0.0,
                          endIndent: 0.0,
                        ),
                        OnTapPressableRowListForSong(
                          startIcon: SvgPicture.asset('assets/music.svg'),
                          title: 'AUD-20210810',
                          subTitle: '<unknown>',
                          endIcon: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                          onTap: () {
                          },
                          onMoreVertTap: () {
                            BottomSheetUtils.showBottomSheet(context);
                          },
                        ),
                        Divider(
                          color: Colors.white,
                          thickness: 1,
                          indent: 0.0,
                          endIndent: 0.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (isSearchBarVisible)
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isSearchBarVisible = !isSearchBarVisible;
                    });
                  },
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            if (isSearchBarVisible)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: AnimSearchBar(
                        width: 400.w,
                        textController: searchController,
                        onSuffixTap: () {
                          setState(() {
                            isSearchBarVisible = false;
                            searchController.clear();
                          });
                        },
                        color: Colors.red[200]!,
                        helpText: "Search Text...",
                        autoFocus: true,
                        closeSearchOnSuffixTap: true,
                        animationDurationInMilli: 2000,
                        rtl: true,
                        onSubmitted: (String query) {
                        },
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
