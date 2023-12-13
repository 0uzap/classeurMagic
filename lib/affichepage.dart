import 'package:flutter/material.dart';

class AffichePage extends StatefulWidget {
  const AffichePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AffichePage> createState() => _AffichePageState();
}

class _AffichePageState extends State<AffichePage> {
  Map<String, dynamic> carte = {};

  Widget afficheData() {
    Column contenu = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.empty(growable: true),
    );

    contenu.children.add(Text(carte['cards'][0]['name'].toString()));
    contenu.children.add(Text(carte['cards'][0]['type'].toString()));
    contenu.children.add(Image.network(
        'https://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=149934&type=card'));

    return contenu;
  }

  @override
  Widget build(BuildContext context) {
    carte = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            afficheData(),
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