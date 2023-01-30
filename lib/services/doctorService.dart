import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/user.dart';



class FirestoreUsers extends GetxController {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection("Users");

  Future<void> addUserToFirestore(Users user) async {
    return await _userCollectionRef
        .doc(user.userId)
        .set(user.toJson())
        .then((value) {})
        .catchError((onError) {});
  }


}
