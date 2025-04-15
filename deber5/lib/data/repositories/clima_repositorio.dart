import 'package:deber5/data/sources/clima_servicio.dart';
import 'package:deber5/dominio/entities/clima.dart';

class ClimaRepositorio {
  final ClimaServicio servicio;

  ClimaRepositorio(this.servicio);

  Future<Clima> getWeather(String ciudad, String apiKey) async {
    final data = await servicio.obtenerClima(ciudad, apiKey);

    return Clima(
      ciudad: ciudad,
      descripcion: data['weather'][0]['description'],
      temperatura: data['main']['temp'],
      viento: data['wind']['speed'],
      humedad: data['main']['humidity'],
    );
  }
}
