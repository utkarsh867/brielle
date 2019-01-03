import 'package:flutter/material.dart';

import '../vibrate_button.dart';

class BrailleLetter extends StatelessWidget {
  final List<bool> vibbutton;
  final String letter;

  BrailleLetter(this.letter, this.vibbutton);
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
                letter,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 100.0),
              ),
            ),
            Container(
              height: 350,
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      VibrateButton(vibbutton[0]),
                      VibrateButton(vibbutton[2]),
                      VibrateButton(vibbutton[4])
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      VibrateButton(vibbutton[1]),
                      VibrateButton(vibbutton[3]),
                      VibrateButton(vibbutton[5])
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
