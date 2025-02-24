import 'package:flutter/material.dart';
import 'dart:async';

class MysimpleDiag extends StatefulWidget {
  const MysimpleDiag({super.key});

  @override
  State<MysimpleDiag> createState() => _MysimpleDiagState();
}
// ignore: constant_identifier_names
enum Answers { YES, NO, MAYBE }

class _MysimpleDiagState extends State<MysimpleDiag> {

   String _value = '';

  void _setValue(String value) {
    setState(() {
      _value = value;
    });
  }
  
   Future _askUser() async {
    final result = await showDialog<Answers>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Te gusta Flutter?'),
          children: [
            SimpleDialogOption(
              child: const Text('Si!'),
              onPressed: () {
                Navigator.pop(context, Answers.YES);
              },
            ),
            SimpleDialogOption(
              child: const Text('NO :('),
              onPressed: () {
                Navigator.pop(context, Answers.NO);
              },
            ),
            SimpleDialogOption(
              child: const Text('Tal vez :|'),
              onPressed: () {
                Navigator.pop(context, Answers.MAYBE);
              },
            ),
          ],
        );
      },
    );


    // Manejo del resultado del diálogo
    switch (result) {
      case Answers.YES:
        _setValue('Yes');
        break;
      case Answers.NO:
        _setValue('No');
        break;
      case Answers.MAYBE:
        _setValue('Maybe');
        break;
      default:
        _setValue('No selection made'); // Por si el usuario cierra el diálogo
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi app'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _value,
                style: TextStyle(fontSize: 24),
              ),
               SizedBox(height: 20),
               ElevatedButton(
                 onPressed: () {
                  _askUser();
                 },
                 child: Text(
                   "Dame Click",
                 ),
               ),

            ],
          ),
        )
      ),
    );
  }
}