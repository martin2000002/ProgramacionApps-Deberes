import 'dart:convert';
import 'package:http/http.dart' as http;

class ClimaServicio {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Map<String, dynamic>> obtenerClima(String ciudad, String apiKey) async {
    final uri = Uri.parse('$baseUrl?q=$ciudad&appid=$apiKey&units=metric');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al obtener el clima: ${response.reasonPhrase}');
    }
  }
}
