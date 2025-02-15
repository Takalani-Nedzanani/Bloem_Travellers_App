//import 'package:bloem_travel_app/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  // String username, userimage, postid;
  // CommentPage(
  //     {super.key,
  //    required this.username,
  //     required this.userimage,
  //   required this.postid});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  TextEditingController commentController = TextEditingController();
  Stream? commentStream;

  getontheload() async {
    // commentStream = await DatabaseMethods().getComments(widget.postid);
    setState(() {});
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  Widget allComments() {
    return StreamBuilder(
      stream: commentStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];

                  return Container(
                    margin: EdgeInsets.only(bottom: 20.0),
                    child: Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(
                                ds["UserImage"],
                                height: 70,
                                width: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  // ds["Username"],
                                  "Takalani Nedzanani",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Text(
                                    // ds["Comment"],
                                    "The Legend",
                                    style: TextStyle(
                                        color:
                                            const Color.fromARGB(230, 0, 0, 0),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 7,
                  ),
                  Text(
                    "Add Comment",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 26,
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
                    children: [
                      Material(
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  "images/boy.jpeg",
                                  height: 70,
                                  width: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Takalani Nedzanani",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
                                    child: Text(
                                      "We will surely visit that place its awesome!",
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              230, 0, 0, 0),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 1.4,
                          child: allComments()),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 20.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.black45,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextField(
                                controller: commentController,
                                decoration: InputDecoration(
                                  hintText: "Write a comment......",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                  border: InputBorder.none,
                                  // suffixIcon: Icon(
                                  //   Icons.send,
                                  //   color: Colors.blue,
                                  // ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          GestureDetector(
                            onTap: () async {
                              // ignore: unused_local_variable
                              Map<String, dynamic> addComment = {
                                // "Username": widget.userimage,
                                // "Userimage": widget.username,
                                // "Comment": commentController.text,
                              };
                              // await DatabaseMethods()
                              // .addComment(addComment, widget.postid);
                              commentController.text = "";
                              setState(() {});
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(Icons.send,
                                  color: Colors.white, size: 30.0),
                            ),
                          ),
                        ],
                      ),
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
