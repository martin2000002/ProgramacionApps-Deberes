import 'package:flutter/material.dart';

class MyAccionsAppBar extends StatefulWidget {
  const MyAccionsAppBar({super.key});

  @override
  State<MyAccionsAppBar> createState() => _MyAccionsAppBarState();
}

class _MyAccionsAppBarState extends State<MyAccionsAppBar> {

   int _value = 0;

  void _add() => setState(() => _value++);
  void _remove() => setState(() => _value--);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi App'),
        backgroundColor: Colors.red,
        actions: [
          IconButton(onPressed: _add, icon: Icon(Icons.add)),
          IconButton(onPressed: _remove, icon: Icon(Icons.remove)),
        ],
      ),
      body:  Center(
        child: Column(
          children: [
            Text(_value.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 37.0))
          ],
        ),
      ),
    );
  }
}