import 'package:flutter/material.dart';

class MyDropdownButton extends StatefulWidget {
  final List<String> options;
  final String option1;
  final String label;

  MyDropdownButton({
    required this.options,
    required this.option1,
    required this.label,
  });

  @override
  _MyDropdownButtonState createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.option1;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10,),
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

// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: MyDropdownButton(
//             options: ['Option 1', 'Option 2', 'Option 3'],
//             option1: 'Option 1',
//             label: 'Select an option:',
//           ),
//         ),
//       ),
//     ),
//   );
// }
