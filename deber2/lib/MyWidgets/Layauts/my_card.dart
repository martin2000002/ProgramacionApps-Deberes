import 'package:flutter/material.dart';
class Mycard extends StatefulWidget {
  const Mycard({super.key});

  @override
  State<Mycard> createState() => _MycardState();
}

class _MycardState extends State<Mycard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi applicacion'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child:  Center(
          child: Column(
            children: [
                 Card(
                  child: Container(
                    padding: EdgeInsets.all(32.0),
                    child: Column(
                      children: [
                         Text('Hola Mundo!'),
                         Text('Como estan?')
                      ],
                    )
                  ),
                 ),
                                  Card(
                  child: Container(
                    padding: EdgeInsets.all(32.0),
                    child: Column(
                      children: [
                         Text('Hola Mundo!'),
                         Text('Como estan?')
                      ],
                    )
                  ),
                 ),
                                  Card(
                  child: Container(
                    padding: EdgeInsets.all(32.0),
                    child: Column(
                      children: [
                         Text('Hola Mundo!'),
                         Text('Como estan?')
                      ],
                    )
                  ),
                 )
            ],
          ),
        )
      ),
    );
  }
}