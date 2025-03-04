import 'package:flutter/material.dart';
import '../Widgets/index.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Screen1> {
  String _inputText = '';
  String _displayText = '';

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
                'Pantalla 1',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                'Subtítulo',
                style: TextStyle(fontSize: 20),
              ),
            ),
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
          },
          displayText: _displayText,
        ),
      ),
    );
  }
}