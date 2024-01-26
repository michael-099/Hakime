import "package:flutter/material.dart";
import "MyTextField.dart";
import "../Login/button.dart";

class Edit extends StatelessWidget {
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 350,
        height: 600,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Text("Edit",
                style: TextStyle(
                    fontSize: 30,
                    color: Color(0xff2E4450).withOpacity(0.90),
                    fontWeight: FontWeight.w200,
                    decoration: TextDecoration.none)),
            MyTextField(
              labelText: "name",
              width: 300,
              obscureText: false,
              color: Color(0xff2E4450).withOpacity(0.60),
            ),
            const SizedBox(
              height: 25,
            ),
            MyTextField(
              
              labelText: " surname name",
              width: 300,
              obscureText: false,
              color: Color(0xff2E4450).withOpacity(0.60),
            ),
            const SizedBox(
              height: 25,
            ),
            MyTextField(
              labelText: "Date of birth",
              width: 300,
              obscureText: false,
              color: Color(0xff2E4450).withOpacity(0.60),
            ),
            const SizedBox(
              height: 25,
            ),
            MyTextField(
              labelText: "City",
              width: 300,
              obscureText: false,
              color: Color(0xff2E4450).withOpacity(0.60),
            ),
            const SizedBox(
              height: 25,
            ),
            MyTextField(
              labelText: "Country",
              width: 300,
              obscureText: false,
              color: Color(0xff2E4450).withOpacity(0.60),
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
                onTap: () => {Navigator.pop(context)},
                child: const Button(
                  height: 40,
                  radius: 20,
                  label: "Continue",
                  width: 200,
                  fontSize: 20,
                )),
            GestureDetector(
                onTap: () => {Navigator.pop(context)},
                child: const Button(
                  height: 40,
                  radius: 20,
                  label: "discard",
                  width: 200,
                  fontSize: 20,
                ))
          ],
        ),
      ),
    );
  }
}
