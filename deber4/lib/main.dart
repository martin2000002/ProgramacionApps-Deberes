import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'providers/battery_bloc.dart';
import 'screens/battery_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monitor de Batería',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => BatteryBloc(),
        child: const BatteryScreen(),
      ),
    );
  }
}