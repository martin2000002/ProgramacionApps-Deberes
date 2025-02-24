import 'package:flutter/material.dart';

class MysnackBar extends StatefulWidget {
  const MysnackBar({super.key});

  @override
  State<MysnackBar> createState() => _MysnackBarState();
}

class _MysnackBarState extends State<MysnackBar> {

    
  // Función para mostrar el SnackBar
  void _showbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Hola Mundo'),
        duration: Duration(seconds: 1),  // El SnackBar se muestra durante 2 segundos
        behavior: SnackBarBehavior.floating,  // Hace que el SnackBar flote sobre la UI
        backgroundColor: Colors.blueAccent,  // Cambia el color de fondo
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi App'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child:  Center(
          child: Column(
            children: [
              Text('Agregar los Widgets aqui'),
              ElevatedButton(
                onPressed: () {
                  _showbar();
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