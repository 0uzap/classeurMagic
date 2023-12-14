import 'package:flutter/material.dart';

import 'affichepage.dart';
import 'myhomepage.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  runApp(const MyApp());
 /*
  // Avoid errors caused by flutter upgrade.
// Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
// Open the database and store the reference.
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'dbmagic.db'),
    // When the database is first created, create a table to store carte.
  onCreate: (db, version) {
    // Run the CREATE TABLE statement on the database.
    return db.execute(
      'CREATE TABLE dbmagic(id INTEGER PRIMARY KEY, name TEXT, type TEXT)',
    );
  },
  // Set the version. This executes the onCreate function and provides a
  // path to perform database upgrades and downgrades.
  version: 1,
  );*/
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
