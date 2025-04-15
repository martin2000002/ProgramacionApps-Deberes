import 'package:deber5/presentacion/widgets/clima_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/repositories/favoritos_repositorio.dart';
import '../../dominio/entities/clima.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late FavoritosRepositorio _repositorio;
  List<Clima> _favoritos = [];

  @override
  void initState() {
    super.initState();
    _repositorio = context.read<FavoritosRepositorio>();
    _cargarFavoritos();
  }

  Future<void> _cargarFavoritos() async {
    final lista = await _repositorio.obtenerTodos();
    setState(() {
      _favoritos = lista;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ciudades Favoritas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refrescar',
            onPressed: _cargarFavoritos,
          ),
        ],
      ),
      body: _favoritos.isEmpty
          ? const Center(child: Text('No hay favoritos'))
          : ListView.builder(
              itemCount: _favoritos.length,
              itemBuilder: (context, index) {
                final clima = _favoritos[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ClimaCard(clima: clima),
                );
              },
            ),
    );
  }
}
