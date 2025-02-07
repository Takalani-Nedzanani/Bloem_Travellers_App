import 'dart:io';

import 'package:bloem_travel_app/pages/home.dart';
import 'package:bloem_travel_app/services/database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String? name, image;

  getthesharedpref() async {
    // name = await SharedpreferenceHelper().getUserDisplayName();
    //image = await SharedpreferenceHelper().getUserImage();
    setState(() {});
  }

  @override
  void initState() {
    getthesharedpref();
    super.initState();
  }

  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    selectedImage = File(image!.path);
    setState(() {});
  }

  TextEditingController placeNameController = TextEditingController();
  TextEditingController cityNameController = TextEditingController();
  TextEditingController captionNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 40.0),
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
                    "Add Post",
                    style: TextStyle(
                        color: Color.fromARGB(255, 86, 197, 186),
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Expanded(
              child: Material(
                elevation: 3.0,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                child: Container(
                  padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      selectedImage != null
                          ? Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(selectedImage!,
                                    height: 180, width: 180, fit: BoxFit.cover),
                              ),
                            )
                          : Center(
                              child: GestureDetector(
                                onTap: () {
                                  getImage();
                                },
                                child: Container(
                                  height: 180,
                                  width: 180,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black45, width: 2.0),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Icon(Icons.camera_alt_outlined),
                                ),
                              ),
                            ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Place Name",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFececf8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          controller: placeNameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Place Name",
                            //  contentPadding: EdgeInsets.only(left: 10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "City Name",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFececf8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          controller: cityNameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter City Name",
                            //  contentPadding: EdgeInsets.only(left: 10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Caption",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFececf8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          controller: captionNameController,
                          maxLines: 6,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Caption...",
                            //  contentPadding: EdgeInsets.only(left: 10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (selectedImage !=
                                  null && // This should be "!=" instead of "=="
                              placeNameController.text.isNotEmpty &&
                              cityNameController.text.isNotEmpty &&
                              captionNameController.text.isNotEmpty) {
                            String addId = randomAlphaNumeric(10);

                            try {
                              Reference firebaseStorageRef = FirebaseStorage
                                  .instance
                                  .ref()
                                  .child("blogImages")
                                  .child("$addId.jpg");

                              UploadTask task =
                                  firebaseStorageRef.putFile(selectedImage!);
                              TaskSnapshot snapshot = await task;
                              String downloadUrl =
                                  await snapshot.ref.getDownloadURL();

                              Map<String, String> addPost = {
                                "ImageUrl": downloadUrl,
                                "PlaceName": placeNameController.text,
                                "CityName": cityNameController.text,
                                "Caption": captionNameController.text,
                                "UserName": name ??
                                    "Takaalani Nedzanani", // Handling null values
                                "UserImage":
                                    image ?? "", // Handling null values
                                // "Like": "[]",
                              };

                              await DatabaseMethods()
                                  .addPost(addPost, addId)
                                  .then((value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.green,
                                    content: Text(
                                      "Post Added Successfully",
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.white),
                                    ),
                                  ),
                                );
                              });
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    "Error: ${e.toString()}",
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.white),
                                  ),
                                ),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  "Please select an image and fill all fields",
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.white),
                                ),
                              ),
                            );
                          }
                        },
                        child: Center(
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 2,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 86, 197, 186),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Post",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
