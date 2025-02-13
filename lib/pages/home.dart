import 'package:bloem_travel_app/pages/add_page.dart';
import 'package:bloem_travel_app/pages/comments.dart';
import 'package:bloem_travel_app/pages/login.dart';
import 'package:bloem_travel_app/pages/top_places.dart';
// import 'package:bloem_travel_app/pages/login_page.dart'; // Ensure you have a login page
import 'package:bloem_travel_app/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? name, image, id;
  Stream? postsStream;

  getthesharedpref() async {
    setState(() {});
  }

  getontheload() async {
    await getthesharedpref();
    postsStream = await DatabaseMethods().getPosts();
    setState(() {});
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  // 🔥 Logout function
  void _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()), // Redirect to login
    );
  }

  Widget allPosts() {
    return StreamBuilder(
      stream: postsStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Material(
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 77, 79, 77),
                                  blurRadius: 12.0,
                                  spreadRadius: 7.0,
                                  offset: Offset(0, 3),
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 10.0),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image.network(
                                        ds["ImageUrl"],
                                        height: 50,
                                        width: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      ds["UserName"],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Image.network(ds["ImageUrl"]),
                              SizedBox(height: 10.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.location_on, color: Colors.blue),
                                    Text(
                                      " ${ds["PlaceName"]}, ${ds["CityName"]}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  ds["Caption"],
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.favorite_outline,
                                        color: Colors.black54, size: 40.0),
                                    SizedBox(width: 10.0),
                                    Text("Like",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(width: 30.0),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => CommentPage(),
                                          ),
                                        );
                                      },
                                      child: Icon(
                                        Icons.comment_outlined,
                                        color: Colors.black54,
                                        size: 28.0,
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                    Text("Comment",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                })
            : Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.asset("images/home1.jpg",
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2.5,
                          fit: BoxFit.cover),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, right: 20.0, left: 25.0),
                        child: Row(
                          children: [
                            Material(
                              elevation: 3.0,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TopPlaces(),
                                      ),
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(60),
                                    child: Image.asset(
                                      "images/world.jpg",
                                      height: 32,
                                      width: 32,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Material(
                              elevation: 3.0,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AddPage(),
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    Icons.add,
                                    size: 30,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Material(
                              elevation: 3.0,
                              borderRadius: BorderRadius.circular(60),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: Image.asset(
                                  "images/boy.jpeg",
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Material(
                              elevation: 3.0,
                              borderRadius: BorderRadius.circular(10),
                              child: IconButton(
                                icon: Icon(Icons.logout),
                                onPressed: () => _logout(context),
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 180.0, left: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bloem Travellers",
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              "Explore the ends of Bloemfontein",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 30.0,
                          right: 30.0,
                          top: MediaQuery.of(context).size.height / 2.7,
                        ),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(width: 1.5),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search your Destination",
                                  suffixIcon: Icon(Icons.search)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40.0),
                ],
              ),
            ),
          ),
          Expanded(child: allPosts()),
        ],
      ),
    );
  }
}
