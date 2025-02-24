import 'package:flutter/material.dart';

class MyrowCol extends StatefulWidget {
  const MyrowCol({super.key});

  @override
  State<MyrowCol> createState() => _MyrowColState();
}

class _MyrowColState extends State<MyrowCol> {

    final TextEditingController _user =  TextEditingController();
  final TextEditingController _pass =  TextEditingController();


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
              Row(
                children: [
                  const Text('Username: '),
                  Expanded(
                    child: TextField(controller: _user,),
                  )
                ],
              ),
              Row(
                children: [
                  Text('Password: '),
                  Expanded(child: TextField(controller: _pass,obscureText: true))
                ],
              ),
              Padding(
                padding: EdgeInsets.all(32.0),
                child: ElevatedButton(
                  onPressed: () {
                    () => print('Login ${_user.text}');
                  },
                  child: Text(
                    "dame click",
                  ),
                ),
                )
            ],
          ),
        )
      ),
    );
  }
}