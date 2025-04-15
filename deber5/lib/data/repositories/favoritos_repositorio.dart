import 'package:deber5/dominio/models/clima_modelo.dart';
import '../../dominio/entities/clima.dart';
import '../../data/local/favoritos_storage.dart';

/// Repositorio abstracto (dominio)
abstract class FavoritosRepositorio {
  Future<void> agregarFavorito(Clima clima);
  Future<void> eliminarFavorito(String ciudad);
  Future<bool> esFavorito(String ciudad);
  Future<List<Clima>> obtenerTodos();
}

/// Implementación concreta (data)
class FavoritosRepositorioImpl implements FavoritosRepositorio {
  final FavoritosStorage storage;

  FavoritosRepositorioImpl({required this.storage});

  @override
  Future<void> agregarFavorito(Clima clima) async {
    final climaModel = ClimaModel(
      ciudad: clima.ciudad,
      temperatura: clima.temperatura,
      viento: clima.viento,
      humedad: clima.humedad,
      descripcion: clima.descripcion,
    );
    await storage.agregarFavorito(climaModel);
  }

  @override
  Future<void> eliminarFavorito(String ciudad) {
    return storage.eliminarFavorito(ciudad);
  }

  @override
  Future<bool> esFavorito(String ciudad) {
    return storage.esFavorito(ciudad);
  }

  @override
  Future<List<Clima>> obtenerTodos() {
    return storage.obtenerTodos();
  }
}
