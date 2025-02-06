import 'package:flutter/material.dart';

class PostPlace extends StatefulWidget {
  //String place;
  const PostPlace({super.key, required String place});

  @override
  State<PostPlace> createState() => _PostPlaceState();
}

class _PostPlaceState extends State<PostPlace> {
  String? name, image, id;




  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
