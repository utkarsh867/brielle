import 'package:flutter/material.dart';

import 'vibrate_button.dart';

class BrailleBoard extends StatelessWidget {
  final List<bool> vibrationButtonPattern;
  BrailleBoard(this.vibrationButtonPattern);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.grey.shade50,
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
