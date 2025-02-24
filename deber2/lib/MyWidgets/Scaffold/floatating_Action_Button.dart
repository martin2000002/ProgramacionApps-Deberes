import 'package:flutter/material.dart';

class MyFloatatingActionBtn extends StatefulWidget {
  const MyFloatatingActionBtn({super.key});

  @override
  State<MyFloatatingActionBtn> createState() => _MyFloatatingActionBtnState();
}

class _MyFloatatingActionBtnState extends State<MyFloatatingActionBtn> {

  String _value = '';
  void _onClicked() => setState(() => _value = DateTime.now().toString());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi app'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {_onClicked();},
        child: const Icon(Icons.add),
      ),
      body:  Center(
        child: Column(
          children: [
            Text(_value)
          ],
        ),
      ),
    );
  }
}