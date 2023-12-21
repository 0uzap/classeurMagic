import 'package:classeur_magic/deck.dart';
import 'package:flutter/material.dart';

import 'affichepage.dart';
import 'myhomepage.dart';
import 'deck.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
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
          '/deck': (BuildContext context) => Deck(title: 'deck', data: {},),
        });
  }
}
