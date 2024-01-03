import "package:flutter/material.dart";

class Ad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0),
            // border: Border.all(
            //   color: Colors.black, // Set border color as needed
            //   width: 2.0, // Set border width as needed
            // ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              'img/Doc.jpeg',
              width: 400.0,
              height: 200.0,
              fit: BoxFit.cover, // Adjust the BoxFit as needed
            ),
          ),
        ),
        Positioned(
          top: 100.0,
          left: 70.0,
          child: ElevatedButton(
            onPressed: () {
              // Add your button's functionality here
            },
            child: Text('Click Me'),
          ),
        ),
      ],
    );
  }
}
