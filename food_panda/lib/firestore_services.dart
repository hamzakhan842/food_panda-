import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_panda/usermodel.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    try {
      await _db.collection('users').doc(user.uid).set(user.toMap());
    } catch (e) {
      print('Error creating user: $e');
    }
  }

  Future<UserModel?> getUser(String uid) async {
    try {
      DocumentSnapshot doc = await _db.collection('users').doc(uid).get();
      if (doc.exists) {
        return UserModel.fromMap(doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      print('Error getting user: $e');
      return null;
    }
  }
}
