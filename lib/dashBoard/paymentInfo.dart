import "package:flutter/material.dart";
import "../Login/MyTextField.dart";
import "./button.dart";
import './paymentMethods.dart';

class Pay extends StatelessWidget {
  Widget build(BuildContext context) {
    final TextEditingController name = TextEditingController();
    final TextEditingController number = TextEditingController();

    return Dialog(
      child: Container(
        width: 500,
        height: 400,
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
            Text(
                " Payment information",
                style: TextStyle(
                    fontSize: 25,
                    color: Color(0xff2E4450).withOpacity(0.90),
                    fontWeight: FontWeight.w200,
                    decoration: TextDecoration.none)),
            PaymentMethods(),
            MyTextField(
                labelText: "cardholder number ",
                width: 200,
                obscureText: false,
                color: Color(0xff2E4450).withOpacity(0.60),
                myController: number),
            MyTextField(
                labelText: "credit card name",
                width: 200,
                obscureText: false,
                color: Color(0xff2E4450).withOpacity(0.60),
                myController: name),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () => {
                Navigator.pop(context),
                // Show alert notification
                _showAlertNotification(context),
              },
              child: const Button(
                height: 40,
                label: "Continue",
                width: 200,
              ),
            )
          ],
        ),
      ),
    );
  }

  // Function to show an alert notification
  void _showAlertNotification(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Payment Successful"),
          content: Text("Your payment was processed successfully."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the alert dialog
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
