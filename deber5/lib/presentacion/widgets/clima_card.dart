import 'package:deber5/dominio/models/clima_modelo.dart';
import 'package:deber5/data/repositories/favoritos_repositorio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../dominio/entities/clima.dart';

class ClimaCard extends StatefulWidget {
  final Clima clima;

  const ClimaCard({
    super.key,
    required this.clima,
  });

  @override
  State<ClimaCard> createState() => _ClimaCardState();
}

class _ClimaCardState extends State<ClimaCard> {
  bool _esFavorito = false;
  late FavoritosRepositorio _repositorio;

  @override
  void initState() {
    super.initState();
    _repositorio = context.read<FavoritosRepositorio>();
    _verificarFavorito();
  }

  Future<void> _verificarFavorito() async {
    final favorito = await _repositorio.esFavorito(widget.clima.ciudad);
    setState(() {
      _esFavorito = favorito;
    });
  }

  Future<void> _toggleFavorito() async {
    if (_esFavorito) {
      await _repositorio.eliminarFavorito(widget.clima.ciudad);
    } else {
      final climaModel = ClimaModel(
        ciudad: widget.clima.ciudad,
        temperatura: widget.clima.temperatura,
        viento: widget.clima.viento,
        humedad: widget.clima.humedad,
        descripcion: widget.clima.descripcion,
      );
      await _repositorio.agregarFavorito(climaModel);
    }

    setState(() {
      _esFavorito = !_esFavorito;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.clima.ciudad,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              IconButton(
                onPressed: _toggleFavorito,
                icon: Icon(
                  _esFavorito ? Icons.favorite : Icons.favorite_border,
                  color: _esFavorito ? Colors.black87 : Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _buildInfo('Temperatura:', '${widget.clima.temperatura}°C'),
          _buildInfo('Viento:', '${widget.clima.viento} m/s'),
          _buildInfo('Humedad:', '${widget.clima.humedad}%'),
          _buildInfo('Descripción:', widget.clima.descripcion),
        ],
      ),
    );
  }

  Widget _buildInfo(String titulo, String valor) {
    return RichText(
      text: TextSpan(
        text: '$titulo ',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 16,
        ),
        children: [
          TextSpan(
            text: valor,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}