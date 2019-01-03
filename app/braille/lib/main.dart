import 'package:flutter/material.dart';

import 'pages/Home.dart';

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
          fontFamily: 'Raleway'),
      home: MyHomePage(title: 'Braille'),
    );
  }
}


