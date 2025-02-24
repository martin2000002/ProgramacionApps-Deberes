import 'package:flutter/material.dart';

class Myslider extends StatefulWidget {
  const Myslider({super.key});

  @override
  State<Myslider> createState() => _MysliderState();
}

class _MysliderState extends State<Myslider> {

   double value1=0.0;
 
  //funciones
  void setvalue(double value)=> setState(() {value1=value; });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My app'),
      ),
      body: Column(
        children: [
        Text("Valor: ${(value1*100).round()}"),
        Slider(value: value1, onChanged: setvalue)

        ],
      ),
    );
  }
}