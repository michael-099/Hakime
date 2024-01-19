import "package:flutter/material.dart";
import "button.dart";

class Baner extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,

        color: Color(0xff89DEE2),
        child: Column(
          children: [
            SizedBox(height: 80,),
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  image: DecorationImage(
                    image: AssetImage(
                      'img/Doc.jpeg',
                    ),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(height:20,),
            Text("jassica Simpson",style:TextStyle(color: Colors.white,fontWeight: FontWeight.w800 ,fontSize:17 ,letterSpacing: 1.5 ,)),
            // Text("Female",style:TextStyle(color: Colors.white ,fontSize:12)),
            Button(label: "Edit Profile", width: 200, height: 40, radius: 30,color:Color.fromARGB(255, 85, 198, 164))
          ],
        ));
  }
}
