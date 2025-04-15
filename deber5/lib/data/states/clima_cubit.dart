import 'package:deber5/data/repositories/clima_repositorio.dart';
import 'package:deber5/dominio/entities/clima.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClimaView {
  final Clima? clima;
  final bool cargando;
  final String? error;

  ClimaView({this.clima, this.cargando = false, this.error});
}

class ClimaCubit extends Cubit<ClimaView> {
  final ClimaRepositorio repositorio;

  ClimaCubit(this.repositorio) : super(ClimaView());

  Future<void> obtenerClima(String ciudad, String apiKey) async {
    emit(ClimaView(cargando: true));
    try {
      final clima = await repositorio.getWeather(ciudad, apiKey);
      emit(ClimaView(clima: clima, cargando: false));
    } catch (e) {
      emit(ClimaView(error: e.toString(), cargando: false));
    }
  }
}
