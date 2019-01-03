import 'package:flutter/material.dart';

import 'braille_letter.dart';

class HomePopupMenu {
  const HomePopupMenu({this.title, this.icon});
  final String title;
  final IconData icon;
}


const List<HomePopupMenu> menuItems = const <HomePopupMenu>[
  const HomePopupMenu(title: 'MenuItem1', icon: Icons.home)
];

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

void letterlogic(String letter, BuildContext context) {
  List<bool> vibbutton;
  letter=letter.toUpperCase();
  switch(letter){
    case "A": {vibbutton = [true, false, false, false, false, false];break;}
    case "B": {vibbutton = [true, false, true, false, false, false];break;}
    case "C": {vibbutton = [true, true, false, false, false, false];break;}
    case "D": {vibbutton = [true, true, false, true, false, false];break;}
    case "E": {vibbutton = [true, false, false, true, false, false];break;}
    case "F": {vibbutton = [true, true, true, false, false, false];break;}
    case "G": {vibbutton = [true, true, true, true, false, false];break;}
    case "H": {vibbutton = [true, false, true, true, false, false];break;}
    case "I": {vibbutton = [false,true, true, false, false, false];break;}
    case "J": {vibbutton = [false , true, true, true, false, false];break;}
    case "K": {vibbutton = [true, false, false, false, true, false];break;}
    case "L": {vibbutton = [true, false, true, false, true, false];break;}
    case "M": {vibbutton = [true, true, false, false, true, false];break;}
    case "N": {vibbutton = [true, true, false, true, true, false];break;}
    case "O": {vibbutton = [true, false, false, true, true, false];break;}
    case "P": {vibbutton = [true, true, true, false, true, false];break;}
    case "Q": {vibbutton = [true, true, true, true, true, false];break;}
    case "R": {vibbutton = [true, false, true,true, true, false];break;}
    case "S": {vibbutton = [false, true, true, false, true, false];break;}
    case "T": {vibbutton = [false, true, true, true, true, false];break;}
    case "U": {vibbutton = [true, false, false, false, true, true];break;}
    case "V": {vibbutton = [true, false, true, false, true, true];break;}
    case "W": {vibbutton = [false, true, true, true, false, true];break;}
    case "X": {vibbutton = [true, true, false, false, true, true];break;}
    case "Y": {vibbutton = [true, true, false, true, true, true];break;}
    case "Z": {vibbutton = [true, false, false, true, true, true];break;}

  }
  
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => BrailleLetter(letter, vibbutton),
    ),
  );
}

class _MyHomePageState extends State<MyHomePage> {
  String _letter = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        actions: <Widget>[
          PopupMenuButton<HomePopupMenu>(
            itemBuilder: (BuildContext context) {
              return menuItems.map((HomePopupMenu _item) {
                return PopupMenuItem<HomePopupMenu>(
                  value: _item,
                  child: Text(_item.title),
                );
              }).toList();
            },
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Letter'),
              onChanged: (String value) {
                setState(() {
                  _letter = value;
                });
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Text('Learn'),
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
              onPressed: () => letterlogic(_letter, context),
            )
          ],
        ),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(40.0)),
            new ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {},
            ),
            new ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () async {
                // TODO: Change the onTap behaviour to something meaningful
                /*if (await Vibration.hasVibrator()) {
                  Vibration.vibrate(duration: 10);
                }*/
              },
            )
          ],
        ),
      ),
    );
  }
}
