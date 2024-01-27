import 'package:flutter/material.dart';
import 'MyTextField.dart';
import '../Login/button.dart';
import 'profile.dart';

class Edit extends StatefulWidget {
  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  late TextEditingController nameController;
  late TextEditingController surnameController;
  late TextEditingController dateOfBirthController;
  late TextEditingController cityController;
  late TextEditingController countryController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController();
    surnameController = TextEditingController();
    dateOfBirthController = TextEditingController();
    cityController = TextEditingController();
    countryController = TextEditingController();

    nameController.text = dataitems[0].subcontent;
    surnameController.text = dataitems[1].subcontent;
    dateOfBirthController.text = dataitems[2].subcontent;
    cityController.text = dataitems[3].subcontent;
    countryController.text = dataitems[4].subcontent;
  }

  @override
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
            Text(
              "Edit",
              style: TextStyle(
                fontSize: 30,
                color: Color(0xff2E4450).withOpacity(0.90),
                fontWeight: FontWeight.w200,
                decoration: TextDecoration.none,
              ),
            ),
            MyTextField(
              labelText: "Name",
              width: 300,
              obscureText: false,
              color: Color(0xff2E4450).withOpacity(0.60),
              myController: nameController,
            ),
            const SizedBox(
              height: 25,
            ),
            MyTextField(
              labelText: "Surname",
              width: 300,
              obscureText: false,
              color: Color(0xff2E4450).withOpacity(0.60),
              myController: surnameController,
            ),
            const SizedBox(
              height: 25,
            ),
            MyTextField(
              labelText: "Date of Birth",
              width: 300,
              obscureText: false,
              color: Color(0xff2E4450).withOpacity(0.60),
              myController: dateOfBirthController,
            ),
            const SizedBox(
              height: 25,
            ),
            MyTextField(
              labelText: "City",
              width: 300,
              obscureText: false,
              color: Color(0xff2E4450).withOpacity(0.60),
              myController: cityController,
            ),
            const SizedBox(
              height: 25,
            ),
            MyTextField(
              labelText: "Country",
              width: 300,
              obscureText: false,
              color: Color(0xff2E4450).withOpacity(0.60),
              myController: countryController,
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                String nameValue = nameController.text;
                String surnameValue = surnameController.text;
                String dateOfBirthValue = dateOfBirthController.text;
                String cityValue = cityController.text;
                String countryValue = countryController.text;
                setState(() {
                  dataitems[0].subcontent = nameValue;
                  dataitems[1].subcontent = surnameValue;
                  dataitems[2].subcontent = dateOfBirthValue;
                  dataitems[3].subcontent = cityValue;
                  dataitems[4].subcontent = countryValue;
                });

                print('Updated dataitems list: $dataitems ' +
                    dataitems[0].subcontent);

                Navigator.pop(context);
              },
              child: const Button(
                height: 40,
                radius: 20,
                label: "Continue",
                width: 200,
                fontSize: 20,
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Button(
                height: 40,
                radius: 20,
                label: "Discard",
                width: 200,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
