import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final ValueChanged<String> onTextChanged;
  final VoidCallback onButtonPressed;
  final String displayText;
  final String hintText;
  final String labelText;

  const MyTextField({
    super.key,
    required this.onTextChanged,
    required this.onButtonPressed,
    required this.displayText,
    this.hintText = 'Escribe aquí',
    this.labelText = '',
  });

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.displayText.isNotEmpty)
          Column(
            children: [
              Text(
                widget.displayText,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
            ],
          ),
        TextField(
          onChanged: widget.onTextChanged,
          decoration: InputDecoration(
            hintText: widget.hintText,
            labelText: widget.labelText,
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: widget.onButtonPressed,
          child: Text('Dame click', style: TextStyle(fontSize: 15)),
        ),
      ],
    );
  }
}