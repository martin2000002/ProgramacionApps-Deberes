import 'package:flutter/material.dart';

class Myicon extends StatefulWidget {
  const Myicon({super.key});

  @override
  State<Myicon> createState() => _MyiconState();
}

class _MyiconState extends State<Myicon> {
   int _value=0;
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My app'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_value.toString(),style: TextStyle(fontSize: 95.0, fontWeight: FontWeight.w200 )),

            IconButton(
              onPressed: () {
                setState(() {
                  _value++;
                });
              },
              icon: const Icon(Icons.plus_one),
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue[100],
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _value--;
                  });
                },
                icon: const Icon(Icons.exposure_minus_1_outlined),
                color: Colors.blue,
                padding: const EdgeInsets.all(16.0),
                   
              ),
            ),
          ],
        ),
      ),
    );
  }
}