import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserDetails(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfoMap);
  }

  Future<QuerySnapshot> getUserByEmail(String email) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("Email", isEqualTo: email)
        .get();
  }

  Future addPost(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Posts")
        .doc(id)
        .set(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getPosts() async {
    return FirebaseFirestore.instance.collection("Posts").snapshots();
  }

  Future addLike(String id, String userid) async {
    return await FirebaseFirestore.instance.collection("Posts").doc(id).update({
      'Like': FieldValue.arrayUnion(
          [userid]) //add the like collection inside the firebase firestore
    });
  }

  Future addComment(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Posts")
        .doc(id)
        .collection("Comments")
        .add(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getComments(String id) async {
    return FirebaseFirestore.instance.collection("Comment").snapshots();
  }

  Future<Stream<QuerySnapshot>> getPostsPlace(String place) async {
    return FirebaseFirestore.instance
        .collection("Posts")
        .where("CityName", isEqualTo: place)
        .snapshots();
  }

  Future<QuerySnapshot> search(String updatedname) async {
    return await FirebaseFirestore.instance
        .collection("Location")
        .where("SearchKey",
            isEqualTo: updatedname.substring(0, 1).toUpperCase())
        .get();
  }
}
