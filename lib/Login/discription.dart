import "package:flutter/material.dart";

class Discription extends StatelessWidget {
  final String text1;
  final String text2;

  Discription({required this.text1, required this.text2});
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
          width: 400,
          height: 200,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Hello,",
                    style: TextStyle(
                      color: Color.fromARGB(249, 0, 72, 136),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    )),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(text1,
                      style: TextStyle(
                          color: Colors.blue[90],
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5))),
              SizedBox(
                height: 10,
                width: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  text2,
                  style: TextStyle(
                    color: Colors.blue[90],
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
