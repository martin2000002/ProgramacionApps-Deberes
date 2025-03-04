import 'package:flutter/material.dart';
import 'dart:async';
import '../Widgets/index.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  String _inputText = '';
  String _displayText = '';
  bool _showBottomAppBar = false;

  void _showBottomAppBarTemporarily() {
    setState(() {
      _showBottomAppBar = true;
    });

    Timer(Duration(seconds: 2), () {
      setState(() {
        _showBottomAppBar = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Pantalla 3',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MyTextField(
          onTextChanged: (text) {
            setState(() {
              _inputText = text;
            });
          },
          onButtonPressed: () {
            setState(() {
              _displayText = _inputText;
            });
            _showBottomAppBarTemporarily();
          },
          displayText: (_showBottomAppBar) ? _displayText : '',
          hintText: 'Ingresa tu nombre',
          labelText: 'Ingresa tu nombre',
        ),
      ),
      bottomNavigationBar: (_showBottomAppBar && _displayText.isNotEmpty)
          ? MyBottomAppBar(text: _inputText)
          : null,
    );
  }
}