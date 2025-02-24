import 'package:flutter/material.dart';

class MyRaisedButton extends StatefulWidget {
  const MyRaisedButton({super.key});
 

  @override
  State<MyRaisedButton> createState() => _MyRaisedButtonState();
}

class _MyRaisedButtonState extends State<MyRaisedButton> {

  String _value = '', _value2 = '';


  void onClick1() {
    _value='Jose Vega';
  }
 void onClick2() {
    _value2='Aplicacion de Botones';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:  Text(_value2,style: TextStyle(fontSize: 20.0),),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Text(_value),
          SizedBox(height: 55.0),
          ElevatedButton(
            onPressed: () {
            setState(() {
              onClick1();
            });
            },
            child: Text(
              "Mi Nombre ",
            ),
          ),
          //SizedBox(height: 5.0),
          ElevatedButton(
            onPressed: () {
             setState(() {
               onClick2();

             });
            },
            child: Text(
              "Nombre de Aplicacion",
            ),
          ),
            ],
          ),
        
      ),
    ); 
  }
}