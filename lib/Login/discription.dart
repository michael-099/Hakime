import "package:flutter/material.dart";

class Discription extends StatelessWidget {
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
          width: 300,
          height: 200,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Hello,",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 136, 20),
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    )),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("login now.",
                      style: TextStyle(
                          color: Colors.blue[90],
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5))),
              SizedBox(
                height: 20,
                width: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "welcome back please fillin the form to sign in and continue ",
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
