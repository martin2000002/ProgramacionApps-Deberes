import 'package:flutter/material.dart';

class MybtnSheet extends StatefulWidget {
  const MybtnSheet({super.key});

  @override
  State<MybtnSheet> createState() => _MybtnSheetState();
}

class _MybtnSheetState extends State<MybtnSheet> {

  void _showBottom() {
    showModalBottomSheet(context: context, 
    builder: (BuildContext context){
      return Container(
        padding: EdgeInsets.all(32.0),
        child: Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Text('Información aqui ', style:  TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
             ElevatedButton(
               onPressed: () {
                Navigator.pop(context);
               },
               child: Text(
                 "Cerrar",
               ),
             ),

          ],
        ),
      );
    },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My app'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child:  Center(
          child: Column(
            children: [
              Text('Agrega Widgets Aqui'),
              ElevatedButton(
                onPressed: () { _showBottom();},
                child: Text(
                  "Da click",
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}