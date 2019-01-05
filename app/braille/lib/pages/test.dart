import 'package:flutter/material.dart';
import 'dart:math';


import 'package:braille_1/components/braille_board.dart';
import 'package:braille_1/functions/letterLogic.dart';
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
  var rng = new Random();
  @override
  Widget build(BuildContext context) {
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
