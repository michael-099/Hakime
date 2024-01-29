import "package:flutter/material.dart";
import "../Login/MyTextField.dart";
import "./button.dart";
import './paymentMethods.dart';
import 'profileCard.dart';
import "data.dart";

List<Datas> dataitems = [
  Datas(
    content: 'Name',
    subcontent: 'vmfk',
    backIcon: Icons.arrow_forward,
    frontIcon: Icons.person,
  ),
  Datas(
    content: 'Specialization',
    subcontent:
        'January 1, 1990 vnfjdkvnfvnfvjf nvfdjkvn vnfjda lvnjfka nvjfak vnafkj vnfjk nfajkbf bnfjk bnbfjdk bdfjbk fnjbfd bnfjda b',
    backIcon: Icons.arrow_forward,
    frontIcon: Icons.medical_information,
  ),
  Datas(
    content: 'City',
    subcontent: 'New York',
    backIcon: Icons.arrow_forward,
    frontIcon: Icons.location_city,
  ),
  Datas(
    content: 'Country',
    subcontent: 'United States',
    backIcon: Icons.public,
    frontIcon: Icons.place_sharp,
  ),
];
List<Datas> subcontents=[
  

]

class Details extends StatelessWidget {
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 450,
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
              height: 30,
            ),
            const CircleAvatar(
              backgroundImage: AssetImage('img/Doc.jpeg'),
              radius: 40,
            ),
            Text("Abebe Kebede",
                style: TextStyle(
                    fontSize: 30,
                    color: Color(0xff2E4450).withOpacity(0.90),
                    fontWeight: FontWeight.w200,
                    decoration: TextDecoration.none)),
            Expanded(
              child: ListView(
                children: dataitems.map((item) {
                  return ProfileCard(
                    content: item.content,
                    subcontent: item.subcontent,
                    frontIcon: item.frontIcon,
                  );
                }).toList(),
              ),
            ),
            GestureDetector(
                onTap: () => {Navigator.pop(context)},
                child: const Button(
                  height: 40,
                  // radius: 20,
                  label: "Done",
                  width: 200,
                  // fontSize: 20,
                ))
          ],
        ),
      ),
    );
  }
}
