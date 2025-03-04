import 'package:flutter/material.dart';

class MyBottomAppBar extends StatelessWidget {
  final String text;

  const MyBottomAppBar({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black87,
      child: Center(
        child: Text(
          'Hola: $text',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}