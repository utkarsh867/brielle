import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:speech_recognition/speech_recognition.dart';
import 'package:braille_1/functions/letterLogic.dart';
import 'braille_letter.dart';
import 'test.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SpeechRecognition _speech = SpeechRecognition();
  bool _speechRecognitionAvailable = false;
  bool _isListening = false;
  String transcription = '';
  String _url =
      'https://aj6yfs2f3b.execute-api.us-east-1.amazonaws.com/deploy/braille_python';
  String _api_key = "F11Z6OB29PjLVp4lVb6o9aKQRUlfvRC1yc6GczSd";

  @override
  initState() {
    super.initState();
    activateSpeechRecognizer();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
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
    _speech
        .listen(locale: 'en_US').then((result){
          setState(() {
            _isListening = result;
          });
    } );
  }

  void stop() => _speech.stop().then((result) {
        setState(() => _isListening = result);
      });

  void sendHTTPRequest(url, api_key) {
    final Map<String, String> data = {"text": transcription};
    http
        .post(url, headers: {'x-api-key': api_key}, body: json.encode(data))
        .then((http.Response response) {
      letterLogic(transcription, context, response.body);
    });
  }

  void letterLogic(String letter, BuildContext context, String url) {
    Letters letterPattern = Letters(letter);
    List<bool> vibrationButtonPattern = letterPattern.vibrationButtonPattern;

    if (vibrationButtonPattern != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              BrailleLetter(letter, vibrationButtonPattern, url),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
<<<<<<< HEAD
            Text(transcription),
            RaisedButton(
              onPressed: () {
                if (_speechRecognitionAvailable && !_isListening) {
                  start();
=======
            GestureDetector(
              child: Stack(
                children: <Widget>[
                  Container(
                    color: Colors.grey.shade100,
                    child: Icon(Icons.mic, size: 400),
                  ),
                ],
              ),
              onTapDown: (TapDownDetails details) {
                if (_speechRecognitionAvailable && !_isListening) start();
              },
              onTapUp: (TapUpDetails details) async{
                if(transcription == ''){
                  await _speech.cancel();
                }
                else{
                  stop();
                  sendHTTPRequest(_url, _api_key);
>>>>>>> 4aa4911f1bc85a26643896ac58301e45b5ce0525
                }
              },
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Test(0, 0, widget.title),
                  ),
                );
              },
              child: Text('Test'),
            )
          ],
        ),
      ),
    );
  }
}
