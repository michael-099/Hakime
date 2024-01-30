import 'package:flutter/material.dart';

class MyDropdownButton extends StatefulWidget {
  final List<String> options;
  final String option1;
  final String label;
  final ValueChanged<String> onChanged;
  final String? initialValue;

  MyDropdownButton({
    required this.options,
    required this.option1,
    required this.label,
    required this.onChanged,
    this.initialValue,
  });

  @override
  _MyDropdownButtonState createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue ?? widget.option1;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            SizedBox(height: 15,),
            Text(
              widget.label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.green.withOpacity(0.5),
              ),
            ),
          ],
        ),
        SizedBox(width: 10,),
        DropdownButton<String>(
          value: selectedValue,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 12,
          elevation: 16,
          style: TextStyle(
            color: Colors.green.withOpacity(0.5),
            fontSize: 12,
          ),
          underline: Container(
            height: 0.5,
            color: Colors.green,
          ),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue!;
              widget.onChanged(newValue!);
            });
          },
          items: widget.options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
