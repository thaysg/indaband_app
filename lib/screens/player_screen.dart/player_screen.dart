import 'dart:async';

import 'package:flutter/material.dart';
import 'package:indaband_app/components/body.dart';
import 'package:indaband_app/models/player_model.dart';
import 'components/album_widget.dart';
import 'components/buttons_music.dart';
import 'components/detail_music.dart';
import 'components/music_slider.dart';
import 'components/time_music.dart';
import 'controller/challenge_controller.dart';

class PlayerScreen extends StatefulWidget {
  final List<PlayerModel> playScreen;
  final String title;

  const PlayerScreen({
    Key? key,
    required this.title,
    required this.playScreen,
  }) : super(key: key);

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  double sliderValue = 2;
  final controller = ChallengeController();
  final pageController = PageController();

  void _incrementCounter() {
    setState(() {
      initialSong += 0.01;
    });
  }

  void _derementCounter() {
    setState(() {
      initialSong -= 0.01;
    });
  }

  bool backButton = false;

  bool playButton = false;

  bool forwardButton = false;

  double initialSong = 0.00;

  double finalSong = 5.10;

  double sliderSoundValue = 0.5;

  void startTimer() async {
    Timer.periodic(
      Duration(seconds: 0),
      (Timer timer) => setState(
        () {
          if (initialSong == 310) {
            timer.cancel();
          } else {
            initialSong += 0.01;
            //timer.cancel();
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
    //startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BodyScreen(
          myWidget: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 343,
                  height: MediaQuery.of(context).size.height * .368,
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: pageController,
                    children: widget.playScreen
                        .map(
                          (e) => AlbumWidget(
                            playS: e,
                          ),
                        )
                        .toList(),
                  ),
                ),
                DetailMuscic(),
                Expanded(
                  child: MusicSlider(
                    sliderValue: initialSong.toDouble(),
                    showLabel: initialSong.toStringAsFixed(2),
                    min: 0,
                    max: 5.10,
                    onChange: (v) {
                      setState(() {
                        initialSong = v;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TimeMusic(
                    initialValue: initialSong.toStringAsFixed(2),
                    finalValue: finalSong.toStringAsFixed(2),
                  ),
                ),
                /* Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _progress.toStringAsFixed(2),
                    ),
                    Text('5.10'),
                  ],
                ), */
                /* LinearProgressIndicator(
                  backgroundColor: Colors.cyanAccent,
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                  value: initialSong = 0,
                ), */
                /* RaisedButton(
                  child: Text('Start timer'),
                  onPressed: () {
                    setState(() {
                      initialSong = 0;
                    });
                    startTimer();
                  },
                ), */
                Expanded(
                  child: ButtonsMusic(
                    onTapRewind: () {
                      setState(() {
                        backButton = !backButton;
                        _derementCounter();
                      });
                    },
                    iconRewind: Icons.skip_previous,
                    backColor: backButton
                        ? Colors.white
                        : Color(0xFFFFFFFF).withOpacity(.38),
                    sizeRewind: 24,
                    onTapPlay: () {
                      setState(() {
                        playButton = !playButton;
                        initialSong = 0;
                        startTimer();
                      });
                    },
                    iconPlay: playButton
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_filled,
                    playColor: Colors.white,
                    sizePlay: 66,
                    onTapForward: () {
                      setState(() {
                        forwardButton = !forwardButton;
                        _incrementCounter();
                      });
                    },
                    iconForward: Icons.skip_next,
                    sizeForward: 24,
                    forwardColor: forwardButton
                        ? Colors.white
                        : Color(0xFFFFFFFF).withOpacity(.38),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.volume_down,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: MusicSlider(
                          min: 0,
                          max: 100,
                          sliderValue: sliderSoundValue,
                          onChange: (s) {
                            setState(() {
                              sliderSoundValue = s;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.volume_up,
                        size: 20,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
