import 'package:flutter/material.dart';

class Deck extends StatelessWidget{
  final Map<String, dynamic> data;

  const Deck({Key? key, required this.data, required String title}): super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deck"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data['cards'][0]['name'].toString()),
            Text(data['cards'][0]['type'].toString()),
          ],
        ),
      ),
    );
  }
}