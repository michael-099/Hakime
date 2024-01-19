import "package:flutter/material.dart";
import "../Login/MyTextField.dart";
import "../Login/button.dart";
import './paymentMethods.dart';

class Pay extends StatelessWidget {
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 350,
        height: 350,
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
              height: 30,
            ),
             Text(" Payment information",
                style: TextStyle(
                    fontSize: 30,
                    color:  Color(0xff2E4450).withOpacity(0.90),
                    fontWeight: FontWeight.w200,
                    decoration: TextDecoration.none)),
            PaymentMethods(),
           
             MyTextField(
                labelText: "cardholder name",
                width: 300,
                obscureText: false,
                color: Color(0xff2E4450).withOpacity(0.60),),
             MyTextField(
                labelText: "credit card name",
                width: 300,
                obscureText: false,
                color:  Color(0xff2E4450).withOpacity(0.60),),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
                onTap: () => {Navigator.pop(context)},
                child: const Button(
                  height: 40,
                  radius: 20,
                  label: "Continue",
                  width: 200,
                  fontSize: 20,
                ))
          ],
        ),
      ),
    );
  }
}
