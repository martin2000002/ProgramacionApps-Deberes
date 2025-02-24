import 'package:flutter/material.dart';

class MynavigationBar extends StatefulWidget {
  const MynavigationBar({super.key});

  @override
  State<MynavigationBar> createState() => _MynavigationBarState();
}

class _MynavigationBarState extends State<MynavigationBar> {

   List<BottomNavigationBarItem> _items = [];
  String _value = '';
  int _index = 0;
  

  @override
  void initState() {
    super.initState(); // <-- inicialización
    _items = [
      const BottomNavigationBarItem(icon: Icon(Icons.people), label: 'People'),
      const BottomNavigationBarItem(icon: Icon(Icons.weekend), label: 'Weekend'),
      const BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi App'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child:  Center(
          child: Column(
            children: [
              Text(_value),
            ],
          ),
        )
      ),
      bottomNavigationBar: BottomNavigationBar(items:
       _items,
       fixedColor: Colors.blue,
        currentIndex: _index,
        onTap: (int item) {
          setState(() {
             _index = item;
            _value = "Valor actual es: ${_index.toString()}";
          });
        },
        ),

    );
  }
}