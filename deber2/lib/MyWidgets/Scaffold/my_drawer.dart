import 'package:flutter/material.dart';

class Mydrawer extends StatefulWidget {
  const Mydrawer({super.key});

  @override
  State<Mydrawer> createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(32.0),
          children: [
            const Text('Hola Drawer', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Perfil'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configuración'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notificaciones'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Cerrar Sesión'),
              onTap: () {
                Navigator.pop(context);
                   ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Sesión cerrada')),
                );
                
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Column(
          children: [
            Text('Aqui van Widgets')
          ],
        ),
      ),
    );
  }
} 
