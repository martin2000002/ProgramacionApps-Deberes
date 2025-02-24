import 'package:flutter/material.dart';

class Myswitch extends StatefulWidget {
  final ValueChanged<bool>? onChanged; // Callback para devolver el estado

  const Myswitch({super.key, this.onChanged});

  @override
  State<Myswitch> createState() => _MyswitchState();
}

class _MyswitchState extends State<Myswitch> {
  bool _isSwitched = false;

  void _toggleSwitch(bool value) {
    setState(() {
      _isSwitched = value;
    });

    // Llamar al callback para notificar el cambio al main.dart
    widget.onChanged?.call(_isSwitched);
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _isSwitched,
      onChanged: _toggleSwitch,
    );
  }
}