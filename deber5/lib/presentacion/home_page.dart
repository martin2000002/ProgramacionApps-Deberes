import 'package:deber5/data/states/api_key_provider.dart';
import 'package:deber5/data/states/clima_cubit.dart';
import 'package:deber5/presentacion/favorites_page.dart';
import 'package:deber5/presentacion/settings_page.dart';
import 'package:deber5/presentacion/widgets/clima_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _cityController = TextEditingController();

  void _consultarClima() {
    final ciudad = _cityController.text.trim();
    final apiKey = context.read<ApiKeyProvider>().apiKey;

    if (apiKey == null || apiKey.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('Primero debe ingresar una API Key en la configuración.'),
        ),
      );
      return;
    }

    if (ciudad.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ingrese una ciudad.')),
      );
      return;
    }

    context.read<ClimaCubit>().obtenerClima(ciudad, apiKey);
  }

  @override
  Widget build(BuildContext context) {
    final estado = context.watch<ClimaCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clima'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const FavoritesPage()),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SettingsPage()),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration:
                  const InputDecoration(labelText: 'Ingrese una ciudad'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _consultarClima,
              child: const Text('Consultar'),
            ),
            const SizedBox(height: 24),
            if (estado.cargando)
              const CircularProgressIndicator()
            else if (estado.error != null)
              Text('Error: ${estado.error}')
            else if (estado.clima != null)
              Center(
                child: ClimaCard(clima: estado.clima!),
              ),
          ],
        ),
      ),
    );
  }
}
