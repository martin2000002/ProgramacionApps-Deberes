import 'package:flutter/material.dart';

class Mycheckboxlist extends StatefulWidget {
  const Mycheckboxlist({super.key});

  @override
  State<Mycheckboxlist> createState() => _MycheckboxlistState();
}

class _MycheckboxlistState extends State<Mycheckboxlist> {
int? _selecccion;
 
  // funcion
 void opcionSeleccionada(int idx) {
    setState(() {
      _selecccion = idx; // Actualizar la opción seleccionada
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body:  Center(
        child: Column(
          children: [
           CheckboxListTile(value: _selecccion==0, onChanged:(_) =>  opcionSeleccionada(0),
        title: Text("Opcion 1"),
        secondary: Icon(Icons.archive),
        activeColor: Colors.green,
        ),
        CheckboxListTile(value:  _selecccion==1, onChanged: (_) =>  opcionSeleccionada(1), 
        title: Text("Opcion 2"),
        secondary: Icon(Icons.archive),
        activeColor: Colors.red,

        )
          ],
        ),
      ),
    );
  }
}