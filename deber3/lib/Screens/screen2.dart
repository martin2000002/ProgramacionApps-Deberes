import 'package:flutter/material.dart';
import '../Widgets/index.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2PageState();
}

class _Screen2PageState extends State<Screen2> {
  String currentDateTime = '';

  @override
  void initState() {
    super.initState();
    _updateDateTime();
  }

  void _updateDateTime() {
    setState(() {
      currentDateTime = DateTime.now().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla 2'),
      ),
      drawer: MyDrawer(onClose: _updateDateTime),
      body: Center(
        child: Column(children: [
          SizedBox(height: 20),
          Text(currentDateTime, style: TextStyle(fontSize: 20)),
        ]),
      ),
    );
  }
}
