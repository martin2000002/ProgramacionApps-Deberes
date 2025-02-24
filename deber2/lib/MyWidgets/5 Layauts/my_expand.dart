import 'package:flutter/material.dart';

class MyExpand extends StatefulWidget {
  const MyExpand({super.key});

  @override
  State<MyExpand> createState() => _MyExpandState();
}

class _MyExpandState extends State<MyExpand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi applicacion'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              const Text('Image Demo'),
              Expanded(
                child: Image.asset('images/flutter.jpg'),
              ),
              Expanded(
                child: Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
              )
            ],
          ),
        )
      ),
    );
  }
}