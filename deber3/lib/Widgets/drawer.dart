import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final VoidCallback onClose;

  const MyDrawer({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: DrawerHeader(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hola Drawer',
            style: TextStyle(fontSize: 24),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                onClose();
                Navigator.pop(context);
              },
              child: Text('Cerrar'),
            ),
          ),
        ],
      )),
    );
  }
}
