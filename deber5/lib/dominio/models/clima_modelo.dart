import 'package:deber5/dominio/entities/clima.dart';

class ClimaModel extends Clima {
  ClimaModel({
    required super.ciudad,
    required super.temperatura,
    required super.viento,
    required super.humedad,
    required super.descripcion,
  });

  Map<String, dynamic> toJson() {
    return {
      'ciudad': ciudad,
      'temperatura': temperatura,
      'viento': viento,
      'humedad': humedad,
      'descripcion': descripcion,
    };
  }

  factory ClimaModel.fromJson(Map<String, dynamic> json) {
    return ClimaModel(
      ciudad: json['ciudad'],
      temperatura: (json['temperatura'] as num).toDouble(),
      viento: json['viento'],
      humedad: json['humedad'],
      descripcion: json['descripcion'],
    );
  }

}