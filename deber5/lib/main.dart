import 'package:deber5/data/local/favoritos_storage.dart';
import 'package:deber5/data/repositories/clima_repositorio.dart';
import 'package:deber5/data/repositories/favoritos_repositorio.dart';
import 'package:deber5/data/sources/clima_servicio.dart';
import 'package:deber5/data/states/api_key_provider.dart';
import 'package:deber5/data/states/clima_cubit.dart';
import 'package:deber5/presentacion/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ApiKeyProvider()),
        Provider<FavoritosRepositorio>(
            create: (_) =>
                FavoritosRepositorioImpl(storage: FavoritosStorage())),
        Provider(create: (_) => ClimaRepositorio(ClimaServicio())),
        BlocProvider(
          create: (context) => ClimaCubit(context.read<ClimaRepositorio>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: const HomePage(),
    );
  }
}
