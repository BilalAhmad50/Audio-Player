import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_player/const/app_color.dart';
import 'package:music_player/const/sizedbox_ext.dart';
import 'package:music_player/view/Favoites/Favorites.dart';
import 'package:music_player/view/audioPlayer/custom_weight.dart';
import 'package:music_player/utils/utils.dart';

class MyAudioPlayer extends StatefulWidget {
  const MyAudioPlayer({super.key});

  @override
  State<MyAudioPlayer> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MyAudioPlayer> {
  bool isPlaying = false;
  late final AudioPlayer player;
  late final AssetSource path;

  Duration _duration = const Duration();
  Duration _position = const Duration();

  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Future initPlayer() async {
    player = AudioPlayer();
    path = AssetSource('audios/ukulele.mp3');

    // set a callback for changing duration
    player.onDurationChanged.listen((Duration d) {
      setState(() => _duration = d);
    });

    // set a callback for position change
    player.onPositionChanged.listen((Duration p) {
      setState(() => _position = p);
    });

    // set a callback for when audio ends
    player.onPlayerComplete.listen((_) {
      setState(() => _position = _duration);
    });
  }

  void playPause() async {
    if (isPlaying) {
      player.pause();
      isPlaying = false;
    } else {
      player.play(path);
      isPlaying = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgr,
      body: SafeArea(
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Favorites()),
                        (route) =>
                            false, 
                      );
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AudioInfo(),
                  10.h.sbh,
                  Slider(
                    value: _position.inSeconds.toDouble(),
                    onChanged: (value) async {
                      await player.seek(Duration(seconds: value.toInt()));
                      setState(() {});
                    },
                    min: 0,
                    max: _duration.inSeconds.toDouble(),
                    inactiveColor: Colors.white,
                    activeColor: Colors.white,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(_duration.format()),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 37.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {
                              player.seek(
                                  Duration(seconds: _position.inSeconds - 10));
                              setState(() {});
                            },
                            child: SvgPicture.asset('assets/shift.svg')),
                        30.w.sbw,
                        InkWell(
                            onTap: () {
                              player.seek(
                                  Duration(seconds: _position.inSeconds - 10));
                              setState(() {});
                            },
                            child: SvgPicture.asset('assets/left.svg')),
                        30.w.sbw,
                        InkWell(
                          onTap: playPause,
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors
                                  .white,
                              border: Border.all(
                                color: Colors.white,
                                width: 0.0,
                              ),
                            ),
                            child: Icon(
                              isPlaying
                                  ? Icons.pause_circle
                                  : Icons.play_circle,
                              color: AppColors
                                  .backgr, 
                              size: 50,
                            ),
                          ),
                        ),
                        30.w.sbw,
                        InkWell(
                            onTap: () {
                              player.seek(
                                  Duration(seconds: _position.inSeconds + 10));
                              setState(() {});
                            },
                            child: SvgPicture.asset('assets/right.svg')),
                      ],
                    ),
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
