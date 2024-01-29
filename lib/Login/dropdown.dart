import 'package:flutter/material.dart';

class MyDropdownButton extends StatefulWidget {
  final List<String> options;
  final String Option1;

  MyDropdownButton({required this.options, required this.Option1});

  @override
  _MyDropdownButtonState createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  String selectedValue = Option1;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 10,
      elevation: 16,
      style: TextStyle(
        color: Colors.deepPurple,
        fontSize: 8, // Adjust the font size as needed
      ),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue!;
        });
      },
      items: widget.options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
