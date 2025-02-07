import 'package:bloem_travel_app/pages/home.dart';
import 'package:bloem_travel_app/pages/post_place.dart';
import 'package:flutter/material.dart';

class TopPlaces extends StatefulWidget {
  const TopPlaces({super.key});

  @override
  State<TopPlaces> createState() => _TopPlacesState();
}

class _TopPlacesState extends State<TopPlaces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 86, 197, 186),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                ),
                Text(
                  "Top Places",
                  style: TextStyle(
                      color: Color.fromARGB(255, 86, 197, 186),
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Material(
              elevation: 3.0,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              child: Container(
                padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PostPlace(
                                          place: "Bloem Show".toLowerCase())));
                            },
                            child: Material(
                              elevation: 3.0,
                              borderRadius: BorderRadius.circular(20),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      "images/bloemshow.jpeg",
                                      height: 300,
                                      width: 190,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 250),
                                    //height: 50,
                                    width: 190,
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                    child: Center(
                                      child: Text(
                                        "Bloem Show",
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Material(
                            elevation: 3.0,
                            borderRadius: BorderRadius.circular(20),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    "images/bloemMandela.jpg",
                                    height: 300,
                                    width: 190,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 250),
                                  width: 190,
                                  // height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20))),
                                  child: Center(
                                    child: Text(
                                      "Mandela",
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            elevation: 3.0,
                            borderRadius: BorderRadius.circular(20),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    "images/militarybase.jpg",
                                    height: 300,
                                    width: 190,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 250),
                                  width: 190,
                                  decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20))),
                                  child: Center(
                                    child: Text(
                                      "Military",
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Material(
                            elevation: 3.0,
                            borderRadius: BorderRadius.circular(20),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    "images/bloem.jpeg",
                                    height: 300,
                                    width: 190,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 250),
                                  width: 190,
                                  decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20))),
                                  child: Center(
                                    child: Text(
                                      "Museum",
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            elevation: 3.0,
                            borderRadius: BorderRadius.circular(20),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    "images/botanicalgardenbloem.jpg",
                                    height: 300,
                                    width: 190,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 250),
                                  width: 190,
                                  decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20))),
                                  child: Center(
                                    child: Text(
                                      "Botanical",
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Material(
                            elevation: 3.0,
                            borderRadius: BorderRadius.circular(20),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    "images/bloem2.jpeg",
                                    height: 300,
                                    width: 190,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 250),
                                  width: 190,
                                  decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20))),
                                  child: Center(
                                    child: Text(
                                      "Bloem Tower",
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
