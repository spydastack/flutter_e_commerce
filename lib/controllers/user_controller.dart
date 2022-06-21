import 'package:cloud_firestore/cloud_firestore.dart';

class UserController {
  final fireStore = FirebaseFirestore.instance;

  Future<DocumentSnapshot> getCurrentUserData(String uid) async {
    try {
      return await fireStore.collection('users').doc(uid).get();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
