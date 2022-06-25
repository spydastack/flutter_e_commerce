import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/const.dart';

class UserController {
  final _fireStore = FirebaseFirestore.instance;

  Future<DocumentSnapshot> getCurrentUserData(String uid) async {
    try {
      return await _fireStore.collection(userCollections).doc(uid).get();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> updateUserData(String uid, Map<String, dynamic> data) async {
    try {
      await _fireStore.collection(userCollections).doc(uid).update(data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
