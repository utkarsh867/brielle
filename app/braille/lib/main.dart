import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class HomePopupMenu{
  const HomePopupMenu({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<HomePopupMenu> menuItems = const <HomePopupMenu>[
  const HomePopupMenu(title: 'MenuItem1', icon: Icons.home)
];

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Braille',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: Colors.grey.shade50,
        fontFamily: 'Raleway'
      ),
      home: MyHomePage(title: 'Braille'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold),),
        elevation: 0,
        actions: <Widget>[
          PopupMenuButton<HomePopupMenu>(
            itemBuilder: (BuildContext context){
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
      body: Center(
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
                if (await Vibration.hasVibrator()){
                  Vibration.vibrate(duration: 10);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
