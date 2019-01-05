import 'package:flutter/material.dart';
import 'dart:math';
import 'package:tts/tts.dart';

import 'package:braille_1/components/braille_board.dart';
import 'package:braille_1/functions/letterLogic.dart';
import 'package:speech_recognition/speech_recognition.dart';

import 'Home.dart';

class Test extends StatefulWidget {
  int qno, score;
  String title;
  static var rng = new Random();

  //Letters letterPattern = Letters(letter);
  Test(this.qno, this.score, this.title);
  List<bool> vibrationButtonPattern =
      Letters(String.fromCharCode(rng.nextInt(26) + 65).toString())
          .vibrationButtonPattern;

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
    Tts.speak(
        'Welcome to the Test.In this test you are required to tell the letters after 5 seconds ');  
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


  String a = 'Bye';
  var rng = new Random();
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 10000), () {
      Tts.speak('Time up ');
      start();
    });
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
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
              onPressed: () => Tts.speak(a),
              child: new Text('Say Hello'),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  widget.qno++;
                  widget.vibrationButtonPattern = Letters(
                          String.fromCharCode(rng.nextInt(26) + 65).toString())
                      .vibrationButtonPattern;
                });
                if (widget.qno > 5) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(title: widget.title),
                    ),
                  );
                }
              },
              child: Text('Continue'),
            ),
            BrailleBoard(widget.vibrationButtonPattern)
          ],
        ),
      ),
    );
  }
}
