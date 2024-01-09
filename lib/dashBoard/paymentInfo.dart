import "package:flutter/material.dart";
import "../Login/MyTextField.dart";
import "../Login/button.dart";

class Pay extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 350,
      child:Column(
          children: [
            Text("Payment Information", style:TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.w200)),
            MyTextField(labelText: "cardholder name",width: 300,obscureText: false,),
            MyTextField(labelText: "credit card name",width: 300,obscureText: false,),
            Button(height: 40,radius: 20, label:"Continue" ,width: 200,fontSize: 20,)
          ],
        ),
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
    );
  }
}
