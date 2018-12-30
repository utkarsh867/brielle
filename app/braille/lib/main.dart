import 'package:flutter/material.dart';

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
      ),
      body: Center(
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(40.0)),
            new ListTile(
              title: const Text("Hello"),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
