import 'package:flutter/material.dart';
import 'dart:math';
import 'package:tts/tts.dart';

import 'package:braille_1/components/braille_board.dart';
import 'package:braille_1/functions/letterLogic.dart';
import 'package:speech_recognition/speech_recognition.dart';

import 'Home.dart';

class Test extends StatefulWidget {
  int qno, score,rno;
  String title;  
  //Letters letterPattern = Letters(letter);
  Test(this.qno, this.score,this.rno, this.title);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Test();
  }
}

class _Test extends State<Test> {
  
  
  SpeechRecognition _speech = SpeechRecognition();
  bool _speechRecognitionAvailable = false;
  bool _isListening = false;
  String transcription = '';
  void initState() {
    super.initState();
    activateSpeechRecognizer();
    if (widget.qno == 0) {
      Tts.speak(
          'Welcome to the Test.In this test you are required to tell the letters after 5 seconds ');
    }
  }

  void activateSpeechRecognizer() {
    _speech = new SpeechRecognition();
    _speech.setAvailabilityHandler(onSpeechAvailability);
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionResultHandler(onRecognitionResult);
    _speech.setRecognitionCompleteHandler(onRecognitionComplete);
    _speech
        .activate()
        .then((res) => setState(() => _speechRecognitionAvailable = res));
  }

  void onSpeechAvailability(bool result) =>
      setState(() => _speechRecognitionAvailable = result);

  void onRecognitionStarted() => setState(() => _isListening = true);

  void onRecognitionComplete() {
    setState(() => _isListening = false);
  }

  void onRecognitionResult(String text) {
    setState(() => transcription = text);
  }

  void start() {
    _speech.listen(locale: 'en_US').then((result) {
      setState(() {
        _isListening = result;
      });
    });
  }

  void stop() => _speech.stop().then((result) {
        setState(() => _isListening = result);
      });

  @override
  Widget build(BuildContext context) {
    int sco = widget.score;
    List<bool> vibrationButtonPattern =
      Letters(String.fromCharCode(widget.rno)).vibrationButtonPattern;
    /*Future.delayed(const Duration(milliseconds: 10000), () {
      Tts.speak('Time up ');
      start();
    });*/
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Tts.speak('Time up ');
                if (_speechRecognitionAvailable && !_isListening) start();
              },
              child: Text('Continue'),
            ),
            RaisedButton(
              child: Text('Stop'),
              onPressed: () async {
                if (transcription == '') {
                  await _speech.cancel();
                } else {
                  stop();
                  if (transcription.toUpperCase() == String.fromCharCode(widget.rno)) {
                    Tts.speak('Correct');
                    /*setState(() {
                      widget.score++;
                    });*/
                    sco++;
                  } else {
                    Tts.speak('Incorrect!');
                  }
                  Future.delayed(Duration(seconds: 3)).then((_){
                    if (widget.qno > 3) {
                    Tts.speak('Awesome but the game is over!Your score is' +
                        widget.score.toString() +
                        ' out of 5.');
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(title: widget.title),
                      ),
                    );
                  } else {
                    var rng = new Random();
                    Tts.speak('Loading a new question');    
                    int rno = rng.nextInt(26) + 65;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Test(widget.qno+1, sco, rno,widget.title),
                      ),
                    );
                  }
                  });
                }
              },
            ),
            BrailleBoard(vibrationButtonPattern)
          ],
        ),
      ),
    );
  }
}

