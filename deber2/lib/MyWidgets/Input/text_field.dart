import 'package:flutter/material.dart';

class Mytextfield extends StatefulWidget {
  const Mytextfield({super.key});

  @override
  State<Mytextfield> createState() => _MytextfieldState();
}

class _MytextfieldState extends State<Mytextfield> {
   String texto='';

  void cambio(String valor) {
    setState(() {
        texto='Cambio: $valor';
    });
  
  }

  void enviar(String valor) {
    setState(() {
      texto='Enviar: $valor';
    });
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: Center(
        child: Column(
          children: [
          Text(texto),
          TextField(
            decoration: InputDecoration(
              labelText: 'Rellenar',
              hintText: 'Nombres',
              icon: Icon(Icons.people),
            ),
            onChanged: cambio,
            onSubmitted: enviar,
          )
          

          ],
        ),
      ),
    );
  }
}