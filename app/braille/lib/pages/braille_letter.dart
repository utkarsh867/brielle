import 'package:flutter/material.dart';
import 'package:audioplayer/audioplayer.dart';
import 'package:braille_1/components/braille_board.dart';


class SoundManager {
  AudioPlayer audioPlayer = new AudioPlayer();
  Future playLocal(url) async {   
    await audioPlayer.play(url);
  }
}

class BrailleLetter extends StatefulWidget {

  BrailleLetter(this.letter, this.vibrationButtonPattern,this.audioUrl);

  final List<bool> vibrationButtonPattern;
  final String letter;
  final String audioUrl;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BrailleLetter();
  }

  void onLoad(BuildContext context) {

    SoundManager soundManager = new SoundManager();

    soundManager.playLocal(audioUrl);
  }
}

class _BrailleLetter extends State<BrailleLetter> {
  
  void initState() {
    super.initState();
    widget.onLoad(context);
  } 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Braille',
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                widget.letter,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 100.0),
              ),
            ),
            BrailleBoard(widget.vibrationButtonPattern),
          ],
        ),
      ),
    );
  }
}
