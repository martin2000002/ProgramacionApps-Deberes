import 'package:flutter/material.dart';

class MyfooterBtn extends StatefulWidget {
  const MyfooterBtn({super.key});

  @override
  State<MyfooterBtn> createState() => _MyfooterBtnState();
}

class _MyfooterBtnState extends State<MyfooterBtn> {

   String _valor = '';

  void _onClick(String boton) => setState(() => _valor = boton);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi App'),
      ),
      persistentFooterButtons: [
        IconButton(onPressed: () => _onClick('Button 1'), icon: Icon(Icons.timer)),
        IconButton(onPressed: () => _onClick('Button 2'), icon: Icon(Icons.people)),
        IconButton(onPressed: () => _onClick('Button 3'), icon: Icon(Icons.map)),
      ],
      body: Container(
        padding: EdgeInsets.all(32.0),
        child:  Center(
          child: Column(
            children: [
              Text(_valor,
                style: TextStyle(fontSize: 24)),
            ],
          ),
        )
      ),
    );
  }
}