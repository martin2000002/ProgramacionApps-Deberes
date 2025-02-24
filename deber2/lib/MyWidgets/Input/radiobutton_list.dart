import 'package:flutter/material.dart';

class MyradioList extends StatefulWidget {
  const MyradioList({super.key});

  @override
  State<MyradioList> createState() => _MyradioListState();
}

class _MyradioListState extends State<MyradioList> {
  int _selectedValue = 0;
 
  // funcion RadioTitles
     List<Widget> makeRadiosTitles(List<String> titles){
      return List<Widget>.generate(titles.length, (index) {
        return RadioListTile<int> (
          value: index, // Assign a unique value for each radio button
           groupValue: _selectedValue, // Current selected value
           onChanged: (int? value) {
            setState(() {
                _selectedValue = value!; // Update the selected value
            });

           },
           title: Text(titles[index]), // Display the title
           secondary: Icon(Icons.people ),
        );
      });
     }
  
  @override
  Widget build(BuildContext context) {
          // Example list of titles
    List<String> radioTitles = ["Option 1", "Option 2", "Option 3"];
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: Column(
      //primera opcion
      ////--------------------------  
      //  children: [
      //    ... makeRadiosTitles(radioTitles), // Generate radio buttons
          // El operador ... toma los elementos de la lista retornada 
          //por makeRadiosTitles y los inserta individualmente en el Column.
          
        //],
        //-------------------------------------
     // Segunda opcion
      crossAxisAlignment: CrossAxisAlignment.start,
      children: makeRadiosTitles(radioTitles), // Generate radio buttons
      //--------------------------------------------
      ),
    );
  }
}