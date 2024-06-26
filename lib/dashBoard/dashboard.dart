import "dart:convert";

import "package:flutter/material.dart";
import "../utils/session.dart";
import "ad.dart";
import "card.dart";
import "search.dart";
import "smallerCard.dart";
import 'TopBar.dart';
import "Text.dart";
import 'details.dart';

class DashBoard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DashboardState();
  }
}

class DashboardState extends State<DashBoard> {
  final TextEditingController searchController = TextEditingController();

  /* Here are some examples data for the following variables
    
    doctorsData = [
                    {
                      "licensePath": "Licenses/65bcc2789e7d2e27a91cb82c_6f9d0530-4100-42b9-86d7-1398a83098ab.pdf",
                      "specialization": "",
                      "yearOfExperience": 0,
                      "verified": true,
                      "id": "65bcc2789e7d2e27a91cb82c",
                      "profession": "string",
                      "fullname": "Yeabesera Derese",
                      "phonenumber": "0911926066",
                      "city": null,
                      "age": null,
                      "imageUrl": null,
                      "role": "Doctor",
                      "email": "user2@example.com",
                      "gender": "Male"
                    }
                  ]
   */

  List<Map<String, dynamic>> doctorsData = [];

  @override
  initState() {
    super.initState();
    fetchDoctors();
  }

  Future<void> fetchDoctors({String queryParameter = ""}) async {
    String baseUrl = "http://localhost:5072/api/doctor";
    // String baseUrl = "https://03f5-196-188-160-63.ngrok-free.app/api/doctor";
    try {
      String doctorsEndpoint = queryParameter != ""
          ? "$baseUrl?specialization=$queryParameter"
          : baseUrl;

      print(doctorsEndpoint);
      final response = await Session.get(doctorsEndpoint);
      Map<String, dynamic> decodedResponse = jsonDecode(response.body);
      print(decodedResponse);
      if (response.statusCode == 200) {
        setState(() {
          List<Map<String, dynamic>> temp =
              (decodedResponse["users"] as List).cast<Map<String, dynamic>>();
          print(temp);
          doctorsData = temp;
        });
        print(
            'Doctors loading successful. Found ${doctorsData.length} doctors');
      } else {
        print("Error while loading doctors");
        print(decodedResponse["errors"] ??
            decodedResponse["error"] ??
            "Unknown error occurred $decodedResponse");
      }
    } catch (error) {
      print('Something went wrong: $error');
      // rethrow;
    }
  }

  Widget build(BuildContext context) {
    int i = 0;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TopBar(
                    categories: "HAKIME",
                    iconData: Icons.notifications_active_outlined,
                    number_of_doctors: "fmdk"),
                const SizedBox(
                  height: 10,
                ),
                Search(
                    searchController: searchController,
                    onSearch: () async {
                      await fetchDoctors(queryParameter: searchController.text);
                      print(
                          "Enter key pressed! Search term: ${searchController.text}");
                      searchController.clear();
                    }),
                const SizedBox(
                  height: 10,
                ),
                Ad(),
                const SizedBox(
                  height: 20,
                ),
                TextW(texts: "catagories"),
                Container(
                  width: 370,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          child: CatagoryCard(
                            iconData: Icons.heat_pump_rounded,
                            categories: "Cardiology",
                            number_of_doctors: "0",
                            image: "img/cardiology.png",
                            description: "",
                          ),
                        ),
                        Container(
                          child: CatagoryCard(
                            iconData: Icons.heat_pump,
                            categories: "Dermatology",
                            number_of_doctors: "0",
                            image: "img/dermatologically-tested.png",
                            description:
                                "Focuses on the skin, diagnosing and treating disorders, infections, and conditions related to skin health.",
                          ),
                        ),
                        Container(
                          child: CatagoryCard(
                            iconData: Icons.heat_pump,
                            categories: "Immunology",
                            number_of_doctors: "0",
                            image: "img/immune-system (1).png",
                            description:
                                "Explores the body's immune system, its functions, and responses to infections, allergies, and diseases.",
                          ),
                        ),
                        Container(
                          child: CatagoryCard(
                            iconData: Icons.heat_pump,
                            categories: "Pathology",
                            number_of_doctors: "0",
                            image: "img/microscope.png",
                            description:
                                "About any disease, examining its causes, mechanisms, and effects on bodily structures and functions.",
                          ),
                        ),
                        Container(
                          child: CatagoryCard(
                            iconData: Icons.heat_pump,
                            categories: "Neurology",
                            number_of_doctors: "1",
                            image: "img/neurology.png",
                            description:
                                "Focuses on the diagnosis and treatment of disorders affecting the nervous system, including the brain.",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextW(
                  texts: "Recommendations",
                ),
                Column(
                  children: doctorsData.map((item) {
                    i += 1;
                    if (i > 6) i = 0;
                    // print("Phone number: ${item["phonenumber"]}");
                    return GestureDetector(
                      child: SmallerCard(
                        name: item["fullname"],
                        specialization: item["specialization"],
                        img: "img/img($i).jpeg",
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .push(HeroDialogRoute(builder: (context) {
                          return Details(
                              name: item["fullname"],
                              specialization: item["specialization"],
                              experience:
                                  "${item["yearOfExperience"].toString()} years",
                              city: item["city"],
                              imgs: "img/img($i).jpeg",
                              pno: item["phonenumber"].toString(),
                              id: item["id"]);
                        }));
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ));
  }
}

class HeroDialogRoute<T> extends PageRoute<T> {
  HeroDialogRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool fullscreenDialog = false,
  })  : _builder = builder,
        super(settings: settings, fullscreenDialog: fullscreenDialog);

  final WidgetBuilder _builder;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Colors.black54;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return _builder(context);
  }

  @override
  String get barrierLabel => 'Popup dialog open';
}
