import 'package:flutter/material.dart';

import 'affichepage.dart';
import 'myhomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Classeur',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const MyHomePage(title: 'Classeur'),
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/affiche': (BuildContext context) => AffichePage(title: 'Affichage'),
          '/login': (BuildContext context) => MyHomePage(title: 'Classeur'),
        });
  }
}