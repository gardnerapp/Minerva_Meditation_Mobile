import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:minerva_meditation/shared/stack_bg_img.dart';

class Player extends StatefulWidget {
  final String title;
  final String track;
  final String backGroundAsset;

  const Player(
      {Key? key, required this.title, required this.track, required this.backGroundAsset})
      : super(key: key);

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  PlayerState _playerState = PlayerState.STOPPED;

  bool get _isPlaying => _playerState == PlayerState.PLAYING;

  @override
  void initState() {
    _audioPlayer.play(this.widget.track);
    _playerState = PlayerState.PLAYING;
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await _audioPlayer.stop();
    await _audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context)
        ),
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 25.0),
        ),
      ),
      body: Stack(children: [
        StackBgImg(img: widget.backGroundAsset),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
                child: Container(
             margin: const EdgeInsets.only(top: 25),
              decoration:
                  BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0)),
              child: Card(
                  shadowColor: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45)),
                  color: Colors.white,
                  child: IconButton(
                      splashColor: Colors.deepOrangeAccent,
                      splashRadius: 80.0,
                      alignment: Alignment.topCenter,
                      color: Colors.black87,
                      iconSize: 150,
                      icon: _isPlaying
                          ? const Icon(Icons
                              .pause) // Pause Icon if playing, Play if not playing
                          : const Icon(Icons.play_arrow),
                      onPressed: () => _playPause())),
            )),
            SizedBox(height: MediaQuery.of(context).size.height * .1,)
          ],
        )
      ]),
    );
  }

  _playPause() async {
    if (_playerState == PlayerState.PLAYING) {
      final playerResult = await _audioPlayer.pause();
      if (playerResult == 1) {
        setState(() {
          _playerState = PlayerState.PAUSED;
        });
      }
    } else if (_playerState == PlayerState.PAUSED) {
      final playerResult = await _audioPlayer.resume();
      if (playerResult == 1) {
        setState(() {
          _playerState = PlayerState.PLAYING;
        });
      }
    }
  }

  Future<void> stopAndDisposePlayer() async {
    _audioPlayer.stop();
   final dispose = await _audioPlayer.dispose();
  }

}
