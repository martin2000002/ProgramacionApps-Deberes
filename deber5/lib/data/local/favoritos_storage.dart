import 'dart:convert';
import 'package:deber5/dominio/models/clima_modelo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritosStorage {
  static const _keyFavoritos = 'ciudades_favoritas';

  Future<List<ClimaModel>> _obtenerListaFavoritos() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_keyFavoritos);
    if (jsonString == null) return [];

    final List<dynamic> decoded = jsonDecode(jsonString);
    return decoded.map((json) => ClimaModel.fromJson(json as Map<String, dynamic>)).toList();
  }

  Future<void> agregarFavorito(ClimaModel clima) async {
    final favoritos = await _obtenerListaFavoritos();
    final existe = favoritos.any((f) => f.ciudad == clima.ciudad);
    if (!existe) {
      favoritos.add(clima);
      final prefs = await SharedPreferences.getInstance();
      final listaJson = favoritos.map((c) => c.toJson()).toList();
      await prefs.setString(_keyFavoritos, jsonEncode(listaJson));
    }
  }

  Future<void> eliminarFavorito(String ciudad) async {
    final favoritos = await _obtenerListaFavoritos();
    final nuevos = favoritos.where((f) => f.ciudad != ciudad).toList();
    final prefs = await SharedPreferences.getInstance();
    final listaJson = nuevos.map((c) => c.toJson()).toList();
    await prefs.setString(_keyFavoritos, jsonEncode(listaJson));
  }

  Future<bool> esFavorito(String ciudad) async {
    final favoritos = await _obtenerListaFavoritos();
    return favoritos.any((f) => f.ciudad == ciudad);
  }

  Future<List<ClimaModel>> obtenerTodos() async {
    return await _obtenerListaFavoritos();
  }
}
