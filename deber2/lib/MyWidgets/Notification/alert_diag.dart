import 'package:flutter/material.dart';
import 'dart:async';

class Myalerta extends StatefulWidget {
  const Myalerta({super.key});

  @override
  State<Myalerta> createState() => _MyalertaState();
}

class _MyalertaState extends State<Myalerta> {

   Future _showAlert(BuildContext context, String message) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {  // Usando el builder 
      return AlertDialog(
        title: Text(message),
        actions: <Widget>[
          TextButton( 
            onPressed: () => Navigator.pop(context),
            child: const Text('Ok'),
          ),
        ],
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi applicacion'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child:  Center(
          child: Column(
            children: [
              Text('Agregar los widgets aqui'),
              ElevatedButton(
                onPressed: () {
                _showAlert(context, 'Esta es una notificación');
                },
                child: Text(
                  "Dame click",
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}