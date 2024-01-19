import 'package:flutter/material.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:40),
      width: 350,
      child: Row(
    
        children: [
        Expanded(child: PImage(pimage: 'img/photo_4_2024-01-19_11-17-32.jpg')),
        SizedBox(width: 30,),
        Expanded(child: PImage(pimage: 'img/photo_3_2024-01-19_11-17-32.jpg')),
        SizedBox(width: 30,),
        Expanded(child: PImage(pimage: 'img/photo_2_2024-01-19_11-17-32.jpg')),
        SizedBox(width: 30,),
        Expanded(child: PImage(pimage: 'img/photo_1_2024-01-19_11-17-32.jpg')),
        ],
      ),
    );
  }
}

class PImage extends StatelessWidget {
  final String pimage;

  PImage({required this.pimage});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      pimage,
      width: 40.0,
      height: 70.0,
    );
  }
}

// child: Column(
//           children: [
//             const SizedBox(
//               height: 30,
//             ),
//             const Text(" Payment information",
//                 style: TextStyle(
//                     fontSize: 30,
//                     color: Colors.black,
//                     fontWeight: FontWeight.w200,
//                     decoration: TextDecoration.none)),
//             Row(
//               children: [
//                 Expanded(
//                   child: Image.asset(
//                     'img/photo_4_2024-01-19_11-17-32.jpg',
//                     width: 10.0,
//                     height: 30.0,
//                     fit: BoxFit.cover, // Adjust the BoxFit as needed
//                   ),
//                 ),
//                 Expanded(
//                   child: Image.asset(
//                     'img/photo_3_2024-01-19_11-17-32.jpg',
//                     width: 50.0,
//                     height: 30.0,
//                     fit: BoxFit.cover, // Adjust the BoxFit as needed
//                   ),
//                 ),
//                 Expanded(
//                   child: Image.asset(
//                     'img/photo_2_2024-01-19_11-17-32.jpg',
//                     width: 50.0,
//                     height: 30.0,
//                     fit: BoxFit.cover, // Adjust the BoxFit as needed
//                   ),
//                 ),
//                 Expanded(
//                   child: Image.asset(
//                     'img/photo_1_2024-01-19_11-17-32.jpg',
//                     width: 50.0,
//                     height: 30.0,
//                     fit: BoxFit.cover, // Adjust the BoxFit as needed
//                   ),
//                 ),
//               ],
//             ),