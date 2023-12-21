import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'deck.dart';

class AffichePage extends StatefulWidget {
  const AffichePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AffichePage> createState() => _AffichePageState();
}

class _AffichePageState extends State<AffichePage> {
  Map<String, dynamic> lescarte = {};

  @override
  void initState() {
    super.initState();
    loadCarteData();
  }

  // Chargez les données depuis SharedPreferences
  void loadCarteData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? carteData = prefs.getString('carte_data');

    if (carteData != null) {
      setState(() {
        lescarte = convert.jsonDecode(carteData);
      });
    }
  }

  Widget afficheData() {
    Column contenu = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.empty(growable: true),
    );

    if (lescarte != null &&
        lescarte['cards'] != null &&
        lescarte['cards'].isNotEmpty) {
      contenu.children.add(Text(lescarte['cards'][0]['name'].toString()));
      contenu.children.add(Text(lescarte['cards'][0]['type'].toString()));
    } else {
      contenu.children.add(Text("Aucune carte trouvée"));
    } // contenu.children.add(Image.network(
    // 'https://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=149934&type=card'));

    return contenu;
  }

  void deck() {
    if (lescarte.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Deck(
            data: lescarte,
            title: '',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    lescarte =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            afficheData(),
            ElevatedButton(
              onPressed: deck,
              child: Text("Envoyer ailleur"),
            ),
          ],
        )),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.search),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/login');
          },
        ));
  }
}
