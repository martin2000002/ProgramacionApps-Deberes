import 'package:flutter/material.dart';
import 'MyWidgets/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Opcional, para quitar la etiqueta "debug"
      home: Myicon(), // Aquí llamas al widget Myicon
    );
  }
}
