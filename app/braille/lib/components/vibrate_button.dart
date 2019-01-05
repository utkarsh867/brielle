import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';



class VibrateButton extends StatelessWidget{
  final vib;
  VibrateButton(this.vib);
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Listener(
          onPointerDown: (PointerDownEvent event) async {
              // TODO: Change the onTap behaviour to something meaningful
              if (vib && await Vibration.hasVibrator()) {
                Vibration.vibrate(duration: 30);
              }
            },
          child: new RawMaterialButton(
            onPressed: (){},
            child: new Icon(
              Icons.album,
              color: Colors.blue,
              size: 80.0,
            ),
            shape: new CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.white,
          ),
        );
    }
}