import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_player/const/app_color.dart';
import 'package:music_player/const/sizedbox_ext.dart';
import 'package:music_player/customweight/mybutton.dart';
import 'package:music_player/utils/bottom_sheet.dart';
import 'package:music_player/utils/pop_up_menu.dart';
import 'package:music_player/view/Favoites/custom_row.dart';
import 'package:music_player/view/listOfSong/list_of_song.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key});

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  bool isSearchBarVisible = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgr,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: AppColors.backgr,
                  floating: true,
                  elevation: 0,
                  title: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListOfSong()),
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
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(top: 60.h),
                    child: Column(
                      children: [
                        Container(
                          child: Stack(
                            children: [
                              Center(
                                child: MyButton(
                                  width: 250.w,
                                  text: 'FAVORITES',
                                  color: Color(0xBF921E04),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10.h),
                                child: Divider(
                                  color: Colors.white,
                                  thickness: 1,
                                  indent: 55,
                                  endIndent: 55,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 17.w, right: 22.w, top: 65.h),
                          child: Column(
                            children: [
                              OnTapPressableRowListForFavorites(
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
                              65.h.sbh,
                              OnTapPressableRowListForFavorites(
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
                            ],
                          ),
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
                        width: 400,
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
