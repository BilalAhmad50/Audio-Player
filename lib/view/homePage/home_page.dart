import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_player/const/app_color.dart';
import 'package:music_player/const/app_style.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:music_player/view/homePage/custom_row.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearchBarVisible = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgr,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: AppColors.backgr,
                floating: true,
                elevation: 0,
                title: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Music Player',
                        style: AppStyle.heading20Whitew400,
                      ),
                    ),
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
                            : GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSearchBarVisible = true;
                                  });
                                },
                                child: SvgPicture.asset(
                                  'assets/clarity_search-line.svg',
                                  key: ValueKey('searchIcon'),
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 135.h),
                  child: Column(
                    children: [
                      CustomRow(
                        startIcon: SvgPicture.asset('assets/foldericon.svg'),
                        title: 'Download',
                        endIcon: Icon(Icons.more_vert, color: Colors.white),
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: 1,
                        indent: 0.0,
                        endIndent: 0.0,
                      ),
                      CustomRow(
                        startIcon: SvgPicture.asset('assets/foldericon.svg'),
                        title: 'My Favourite ',
                        endIcon: Icon(Icons.more_vert, color: Colors.white),
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: 1,
                        indent: 0.0,
                        endIndent: 0.0,
                      ),
                      CustomRow(
                        startIcon: SvgPicture.asset('assets/foldericon.svg'),
                        title: 'What’sApp Audio',
                        endIcon: Icon(Icons.more_vert, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (isSearchBarVisible)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isSearchBarVisible = !isSearchBarVisible;
                  });
                },
                child: isSearchBarVisible ? Container() : Container(),
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
                    padding: EdgeInsets.all(16.0.r),
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
                      onSubmitted: (String query) {},
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
