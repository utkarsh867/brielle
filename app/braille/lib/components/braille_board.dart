import 'package:flutter/material.dart';

import 'vibrate_button.dart';

class BrailleBoard extends StatelessWidget {
  final List<bool> vibrationButtonPattern;
  BrailleBoard(this.vibrationButtonPattern);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 350,
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              VibrateButton(vibrationButtonPattern[0]),
              VibrateButton(vibrationButtonPattern[2]),
              VibrateButton(vibrationButtonPattern[4])
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              VibrateButton(vibrationButtonPattern[1]),
              VibrateButton(vibrationButtonPattern[3]),
              VibrateButton(vibrationButtonPattern[5])
            ],
          )
        ],
      ),
    );
  }
}
